import 'dart:convert';
import 'package:toko_kita/helpers/api.dart';
import 'package:toko_kita/helpers/api_url.dart';
import 'package:toko_kita/model/login.dart';

class LoginBloc {
  static Future<Login?> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;
    var body = {"email": email, "password": password};
    var response = await Api().post(apiUrl, body);

    if (response != null &&
        response['data'] != null &&
        response['data']['token'] != null) {
      return Login.fromJson(response);
    } else {
      throw Exception("Login failed, invalid response");
    }
  }
}
