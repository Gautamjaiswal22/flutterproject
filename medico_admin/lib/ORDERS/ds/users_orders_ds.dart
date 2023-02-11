class Customer {
  final String name;

  Customer({
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
      };
  static Customer fromJson(Map<String, dynamic> json) => Customer(
        name: json['name'],
      );
}
