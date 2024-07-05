class Login {
  final String token;
  final int userID;
  final String email;

  Login({required this.token, required this.userID, required this.email});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      token: json['data']['token'],
      userID: int.parse(
          json['data']['user']['id'].toString()), // Konversi ke integer
      email: json['data']['user']['email'],
    );
  }
}
