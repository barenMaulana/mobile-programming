import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toko_kita/helpers/user_info.dart';
import 'app_exception.dart';

class Api {
  Future<dynamic> post(String url, Map<String, dynamic> data) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(data),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, Map<String, dynamic> data) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.put(
        Uri.parse(url),
        body: json.encode(data),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 422:
        throw InvalidInputException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode :${response.statusCode}');
    }
  }
}
