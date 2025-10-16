class UserModel {
  final String email;
  final String password;

  const UserModel({required this.email, required this.password});

  bool isMatch(String inputEmail, String inputPassword) {
    return email == inputEmail && password == inputPassword;
  }
}
