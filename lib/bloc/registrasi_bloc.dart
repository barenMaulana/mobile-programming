import 'dart:convert';
import 'package:toko_kita/helpers/api.dart';
import 'package:toko_kita/helpers/api_url.dart';
import 'package:toko_kita/model/registrasi.dart';
import 'package:flutter/foundation.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {String? nama, String? email, String? password}) async {
    String apiUrl = ApiUrl.registrasi;

    var body = {"nama": nama, "email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    debugPrint(response['success'].toString());
    if (response['success'].toString() == 'true') {
      return Registrasi.fromJson(response);
    } else {
      throw Exception(
          response['message'] ?? 'Registrasi gagal, silahkan coba lagi');
    }
  }
}
