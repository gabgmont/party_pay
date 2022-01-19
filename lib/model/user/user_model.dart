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

  String cpfValue() => cpf!.replaceAll('.', '').replaceAll('-', '');

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

  String getInitials() {
    List<String> names = name.split(' ');
    String initials = '';
    int numWords = 2;

    if(numWords > names.length) {
      numWords = names.length;
    }
    for(var i = 0; i < numWords; i++){
      initials += names[i][0];
    }
    return initials.toUpperCase();
  }
}
