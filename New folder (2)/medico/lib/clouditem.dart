class Products {
  String id;
  final int mid;
  final String name;
  final int mrp;
  final int rate;
  final int itemcount;

  Products({
    this.id = '',
    required this.mid,
    required this.name,
    required this.mrp,
    required this.rate,
    required this.itemcount,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'mid': mid,
        'name': name,
        'mrp': mrp,
        'rate': rate,
        'itemcount': itemcount,
      };
  static Products fromJson(Map<String, dynamic> json) => Products(
      id: json['id'],
      mid: json['mid'],
      name: json['name'],
      mrp: json['mrp'],
      rate: json['rate'],
      itemcount: json['itemcount']);
}
