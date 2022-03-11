import 'package:partypay/shared/utils/AppImages.dart';

class UserModel {
  final String name;
  String? username;
  String? secret;
  String? email;
  String? phone;
  String? photo;

  UserModel({
    required this.name,
    this.username,
    this.email,
    this.phone,
    this.photo = AppImages.userPicture,
  });

  String usernameValue() => username!.replaceAll('.', '').replaceAll('-', '');

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        username = json['username'],
        email = json['email'],
        phone = json['phone'],
        photo = json['photo'];

  Map<String, dynamic> toJson() => {
        '"name"': '"$name"',
        '"username"': '"$username"',
        '"email"': '"$email"',
        '"phone"': '"$phone"',
        '"photo"': '"$photo"',
      };

  Map<String, dynamic> toMap() => {
        'name': name,
        'username': username,
        'email': email,
        'phone': phone,
        'photo': photo
      };

  String getInitials() {
    List<String> names = name.split(' ');
    String initials = '';
    int numWords = 2;

    if (numWords > names.length) {
      numWords = names.length;
    }
    for (var i = 0; i < numWords; i++) {
      initials += names[i][0];
    }
    return initials.toUpperCase();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          username == other.username;

  @override
  int get hashCode => username.hashCode;
}
