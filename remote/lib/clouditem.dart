class Products {
  String id;
  final int status;
  final String name;
  bool onbut;
  bool offbut;
  final word_status;

  Products({
    this.id = '',
    required this.status,
    required this.name,
    required this.onbut,
    required this.offbut,
    required this.word_status,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'itemcount': status,
        'name': name,
        'onbut': onbut,
        'offbut': offbut,
        'word_status': word_status,
      };
  static Products fromJson(Map<String, dynamic> json) => Products(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      onbut: json['onbut'],
      offbut: json['offbut'],
      word_status: json['word_status']);
}

class network {
  String id;
  final int status;

  network({
    this.id = '',
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'itemcount': status,
      };
  static network fromJson(Map<String, dynamic> json) =>
      network(id: json['id'], status: json['status']);
}
