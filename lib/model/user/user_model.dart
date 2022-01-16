class User {
  final String name;
  String? cpf;
  String? secret;
  String? email;
  String? phone;
  String? photo;

  User({
    required this.name,
    this.cpf,
    this.email,
    this.phone,
    this.photo,
  });

  Map<String, dynamic> toJson() =>
      {
        '"name"': '"$name"',
        '"cpf"': '"$cpf"',
        '"email"': '"$email"',
        '"phone"': '"$phone"',
        '"photo"': '"$photo"',
      };

  Map<String, dynamic> toMap() =>
      {
        'name': name,
        'cpf' : cpf,
        'email' : email,
        'phone' : phone,
        'photo' : photo
      };
}
