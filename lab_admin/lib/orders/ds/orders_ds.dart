// import 'dart:html';

class Products {
  final String id;
  final String name;
  final int rate;

  Products({
    required this.id,
    required this.name,
    required this.rate,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rate': rate,
      };
  static Products fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        name: json['name'],
        rate: json['rate'],
      );
}
