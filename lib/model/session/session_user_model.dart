import 'package:partypay/model/session/order_model.dart';
import 'package:partypay/model/user/user_model.dart';

class SessionUserModel {
  final double value;
  final UserModel user;
  final List<OrderModel> orders;

  SessionUserModel(
      {required this.value, required this.user, required this.orders});

  SessionUserModel.fromJson(Map<String, dynamic> json)
      : value = double.parse(json['total_value'].toString()),
        user = UserModel.fromJson(json['user']),
        orders = (json['order_list'] as List)
            .map((orderJson) {
          var order = OrderModel.fromResumeJson(orderJson['order']);
          order.valuePerUser = orderJson['value_per_user'];
          return order;
        })
            .toList();
}
