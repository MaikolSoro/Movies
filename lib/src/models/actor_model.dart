class Cast {
  List<Actor> actores = [];

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
      actores.add(actor);
    });
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getPhoto() {
    if (profilePath == null) {
      return 'https://lh3.googleusercontent.com/proxy/1SFjiGgcwpHbwY_JtWSTHKJckPQsl9a0A8aK1QteBWeX0ccHFxFrfw73A3VZn2FnJfyWWopiAcesyC_3i2vyi87Tss2O4lyFJDA50kbU2nvEJs_yLoOQKBLjPsXwpy97LL4eSvJyBOnASHTTmdgULZ5IfUSHqV26ZqRax10FvkP3YoTvUj0NN6XIYf6aSk0TGOLBFG0Yvo_s7TVPRo6iTXXsredWzIQHYBq-JH0opc5O-iL3ROjAlClgKbNENvncogq1RmMGum-Khp3x1LtQ5la7mIPBysxOfcHSEAywMKxiu7UII5e0tifB_NWgMX9WR85hEPY9h2cH79EMT6Ix38TP4RGx7tk8xqCg3UDsmSvP7xZf1u9fqsO5Kda72SolRcUBKBwPy7PPvbWnx4BpGcRinpNtazQgOVpLFVwvqlv0jpkF7ze37YLu43ou8vlmXOT5B8z34GvkneZbOM7WksaVDt0b7JlRASN6Ci30eJv3bTsxnk94xiIs8LKaGxHOlKoiHdgu_btFwRD8mT3sWStSldflh8dJifhijdzG6lzy2bMDHSWWD_s8c-K1OZTsoORBoc4';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
