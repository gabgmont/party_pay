import '../user/user_model.dart';
import 'session_order_model.dart';

class SessionModel {
  final int id;
  final String restaurant;
  final int table;
  final List<SessionOrderModel> sessionOrderList;
  final List<UserModel> userList;

  SessionModel(
      {required this.id,
      required this.restaurant,
      required this.table,
      required this.sessionOrderList,
      required this.userList});

  SessionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        restaurant = json['restaurant'],
        table = json['table'],
        sessionOrderList = (json['order_list'] as List)
            .map((json) => SessionOrderModel.fromJson(json))
            .toList(),
        userList = (json['user_list'] as List)
            .map((json) => UserModel.fromJson(json))
            .toList();
}
