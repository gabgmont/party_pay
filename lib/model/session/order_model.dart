class OrderModel {
  final int orderId;
  final String name;
  final String image;
  final String description;
  final double value;

  late double valuePerUser;

  OrderModel(this.orderId, this.name, this.description, this.value, this.image);

  OrderModel.fromJson(Map<String, dynamic> json)
      : orderId = json['order_id'],
        name = json['name'],
        image = json['image'],
        description = json['description'],
        value = json['value'].toDouble();

  OrderModel.fromResumeJson(Map<String, dynamic> json)
      : orderId = json['order_id'],
        name = json['name'],
        image = json['image'],
        description = '',
        value = json['value'].toDouble();
}
