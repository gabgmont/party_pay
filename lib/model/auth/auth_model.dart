class AuthenticationModel {
  final String email;
  final String secret;

  AuthenticationModel(this.email, this.secret);

  Map<String, dynamic> toJson() => {
    '"email"' : '"$email"',
    '"secret"' : '"$secret"'
  };
}