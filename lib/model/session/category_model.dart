import 'order_model.dart';

class CategoryModel {
  final String name;
  final List<OrderModel> orderList;

  CategoryModel(this.name, this.orderList);

  CategoryModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        orderList = (json['order_list'] as List)
            .map((orderJson) => OrderModel.fromJson(orderJson))
            .toList();
}
