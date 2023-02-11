// import 'dart:html';

class Products {
  final String id;
  final String name;
  final int mrp;
  final int rate;
  final int total;
  final int item_count;
  Products({
    required this.id,
    required this.name,
    required this.mrp,
    required this.rate,
    required this.total,
    required this.item_count,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'mrp': mrp,
        'rate': rate,
        'total': total,
        'item_count': item_count
      };
  static Products fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        name: json['name'],
        mrp: json['mrp'],
        rate: json['rate'],
        total: json['total'],
        item_count: json['item_count'],
      );
}
