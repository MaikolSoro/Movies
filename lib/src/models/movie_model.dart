class Movies {
  List<Movie> items = [];
  Movies();
  Movies.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final movie = new Movie.fromJsonMap(item);
      items.add(movie);
    }
  }
}

class Movie {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Movie({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }
  getPosterImg() {
    if (posterPath == null) {
      return 'https://lh3.googleusercontent.com/proxy/1SFjiGgcwpHbwY_JtWSTHKJckPQsl9a0A8aK1QteBWeX0ccHFxFrfw73A3VZn2FnJfyWWopiAcesyC_3i2vyi87Tss2O4lyFJDA50kbU2nvEJs_yLoOQKBLjPsXwpy97LL4eSvJyBOnASHTTmdgULZ5IfUSHqV26ZqRax10FvkP3YoTvUj0NN6XIYf6aSk0TGOLBFG0Yvo_s7TVPRo6iTXXsredWzIQHYBq-JH0opc5O-iL3ROjAlClgKbNENvncogq1RmMGum-Khp3x1LtQ5la7mIPBysxOfcHSEAywMKxiu7UII5e0tifB_NWgMX9WR85hEPY9h2cH79EMT6Ix38TP4RGx7tk8xqCg3UDsmSvP7xZf1u9fqsO5Kda72SolRcUBKBwPy7PPvbWnx4BpGcRinpNtazQgOVpLFVwvqlv0jpkF7ze37YLu43ou8vlmXOT5B8z34GvkneZbOM7WksaVDt0b7JlRASN6Ci30eJv3bTsxnk94xiIs8LKaGxHOlKoiHdgu_btFwRD8mT3sWStSldflh8dJifhijdzG6lzy2bMDHSWWD_s8c-K1OZTsoORBoc4';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getBackgroundImg() {
    if (posterPath == null) {
      return 'https://lh3.googleusercontent.com/proxy/1SFjiGgcwpHbwY_JtWSTHKJckPQsl9a0A8aK1QteBWeX0ccHFxFrfw73A3VZn2FnJfyWWopiAcesyC_3i2vyi87Tss2O4lyFJDA50kbU2nvEJs_yLoOQKBLjPsXwpy97LL4eSvJyBOnASHTTmdgULZ5IfUSHqV26ZqRax10FvkP3YoTvUj0NN6XIYf6aSk0TGOLBFG0Yvo_s7TVPRo6iTXXsredWzIQHYBq-JH0opc5O-iL3ROjAlClgKbNENvncogq1RmMGum-Khp3x1LtQ5la7mIPBysxOfcHSEAywMKxiu7UII5e0tifB_NWgMX9WR85hEPY9h2cH79EMT6Ix38TP4RGx7tk8xqCg3UDsmSvP7xZf1u9fqsO5Kda72SolRcUBKBwPy7PPvbWnx4BpGcRinpNtazQgOVpLFVwvqlv0jpkF7ze37YLu43ou8vlmXOT5B8z34GvkneZbOM7WksaVDt0b7JlRASN6Ci30eJv3bTsxnk94xiIs8LKaGxHOlKoiHdgu_btFwRD8mT3sWStSldflh8dJifhijdzG6lzy2bMDHSWWD_s8c-K1OZTsoORBoc4';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }
}
