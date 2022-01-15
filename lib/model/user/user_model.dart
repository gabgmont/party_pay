class User {
  final int idUser;
  final String name;
  String? cpf;
  String? email;
  String? secret;
  String? phone;
  String? photo;

  User(
      {required this.idUser,
      required this.name,
      this.cpf,
      this.email,
      this.secret,
      this.phone,
      this.photo});
}