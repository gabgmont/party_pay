class User {
  final String name;
  String? cpf;
  String? email;
  String? secret;
  String? phone;
  String? photo;

  User(
      {required this.name,
      this.cpf,
      this.email,
      this.secret,
      this.phone,
      this.photo});
}
