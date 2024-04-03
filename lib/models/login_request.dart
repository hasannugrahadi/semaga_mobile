class LoginRequest {
  final String nis;
  final String password;

  LoginRequest({
    required this.nis,
    required this.password
  });

  Map<String, dynamic> toJson() {
    return {
      'nis': nis,
      'password': password,
    };
  }
}