import 'order_model.dart';

class CategoryModel {
  final String name;
  final int categoryId;
  final List<OrderModel> orderList;

  CategoryModel(this.name, this.categoryId, this.orderList);

  CategoryModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        categoryId = json['category_id'],
        orderList = (json['order_list'] as List)
            .map((orderJson) => OrderModel.fromJson(orderJson))
            .toList();
}
