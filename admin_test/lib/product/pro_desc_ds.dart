class Products {
  final String id;
  final String name;
  final String MRP;
  final String RATE;
  Products(
      {required this.id,
      required this.name,
      required this.MRP,
      required this.RATE});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'MRP': MRP,
        'RATE': RATE,
      };
  static Products fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        name: json['name'],
        MRP: json['MRP'],
        RATE: json['RATE'],
      );
}
