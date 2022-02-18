import 'package:partypay/shared/utils/AppImages.dart';

class UserModel {
  final String name;
  String? cpf;
  String? secret;
  String? email;
  String? phone;
  String? photo;

  UserModel({
    required this.name,
    this.cpf,
    this.email,
    this.phone,
    this.photo = AppImages.userPicture,
  });

  String cpfValue() => cpf!.replaceAll('.', '').replaceAll('-', '');

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        cpf = json['cpf'],
        email = json['email'],
        phone = json['phone'],
        photo = json['photo'];

  Map<String, dynamic> toJson() => {
        '"name"': '"$name"',
        '"cpf"': '"$cpf"',
        '"email"': '"$email"',
        '"phone"': '"$phone"',
        '"photo"': '"$photo"',
      };

  Map<String, dynamic> toMap() => {
        'name': name,
        'cpf': cpf,
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
          cpf == other.cpf;

  @override
  int get hashCode => cpf.hashCode;
}
