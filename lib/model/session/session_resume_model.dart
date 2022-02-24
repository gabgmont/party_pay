import 'session_user_model.dart';

class SessionResumeModel {
  final double check;
  final List<SessionUserModel> userList;

  SessionResumeModel({required this.check, required this.userList});

  SessionResumeModel.fromJson(Map<String, dynamic> json)
      : check = json['check'],
        userList = (json['user_list'] as List)
            .map((userJson) => SessionUserModel.fromJson(userJson))
            .toList();
}
