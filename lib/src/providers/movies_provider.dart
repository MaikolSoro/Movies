import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies/src/models/movie_model.dart';

class MoviesProvider {
  String _apikey = 'c17dd352644a62b6500651f8540754e9';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  int _popPage = 0;
  bool _loading = false;

  List<Movie> _populate = [];
  final _popStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularesSink => _popStreamController.sink.add;

  Stream<List<Movie>> get popularesStream => _popStreamController.stream;

  void disposeStreams() {
    _popStreamController?.close();
  }

  Future<List<Movie>> _response(Uri url) async {
    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final movies = new Movies.fromJsonList(decodedData['results']);

    return movies.items;
  }

  Future<List<Movie>> getCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _languaje});

    return await _response(url);
  }

  Future<List<Movie>> getMoviesPopular() async {
    if (_loading) return [];
    _loading = true;
    _popPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _languaje,
      'page': _popPage.toString()
    });
    final resp = await _response(url);
    _populate.addAll(resp);
    popularesSink(_populate);
    return resp;
  }
}
