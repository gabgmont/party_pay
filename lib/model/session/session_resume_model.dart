import 'session_user_model.dart';

class SessionResumeModel {
  final double check;
  final int menuId;
  final List<SessionUserModel> userList;

  SessionResumeModel({required this.check, required this.menuId,  required this.userList});

  SessionResumeModel.fromJson(Map<String, dynamic> json)
      : check = double.parse(json['check'].toString()),
        menuId = json['menu_id'],
        userList = (json['user_list'] as List)
            .map((userJson) => SessionUserModel.fromJson(userJson))
            .toList();
}
