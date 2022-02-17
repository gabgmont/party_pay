import 'package:partypay/model/session/order_model.dart';
import 'package:partypay/model/user/user_model.dart';

class SessionOrderModel {
  final OrderModel order;
  final String orderStatus;
  final List<UserModel> userList;
  final double valuePerUser;

  SessionOrderModel(this.order, this.orderStatus, this.userList, this.valuePerUser);
  
  SessionOrderModel.fromJson(Map<String, dynamic> json) :
      order = OrderModel.fromJson(json['order']),
      orderStatus = json['order_status'],
      userList = (json['user_list'] as List).map((json) => UserModel.fromJson(json)).toList(),
      valuePerUser = json['value_per_user'];
}