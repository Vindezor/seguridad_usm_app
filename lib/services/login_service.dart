import 'dart:async';

import 'package:dio/dio.dart';
import 'package:login_app/models/login_model.dart';
import 'package:login_app/services/utils/global_ip.dart';

class LoginService {
  final Dio _dio;

  LoginService(this._dio);

  Future<LoginModel> login(String username, String password) async {
    try {
      final response = await _dio.post(
        "$ip/login",
        data: {"username": username, "pw": password},
      );
      final resp = LoginModel.fromJson(response.data);
      return resp;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return LoginModel(
            status: "ERROR", msg: "Error del servidor", data: null);
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        return LoginModel(
            status: "ERROR", msg: "Sin conexión a internet", data: null);
      }
      return LoginModel(status: "ERROR", msg: "Error $e", data: null);
    }
  }
}
