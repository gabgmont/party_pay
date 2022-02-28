class OrderModel {
  final String name;
  final String description;
  final double value;

  late double valuePerUser;

  OrderModel(this.name, this.description, this.value);

  OrderModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        value = json['value'].toDouble();

  OrderModel.fromResumeJson(Map<String, dynamic> json)
      : name = json['name'],
        description = '',
        value = json['value'].toDouble();
}
