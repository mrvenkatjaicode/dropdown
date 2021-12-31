class Nissan {
  String model;
  int doors;

  Nissan({this.model, this.doors});

  Nissan.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    doors = json['doors'];
  }
}

class Ford {
  String model;
  int doors;

  Ford({this.model, this.doors});

  Ford.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    doors = json['doors'];
  }
}
