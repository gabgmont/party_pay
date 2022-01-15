class AuthenticationModel {
  final String email;
  final String secret;

  AuthenticationModel(this.email, this.secret);

  Map<String, dynamic> toJson() => {
    '"cpf"' : '"$email"',
    '"secret"' : '"$secret"'
  };
}