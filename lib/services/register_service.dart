import 'dart:async';

import 'package:dio/dio.dart';
import 'package:login_app/services/utils/global_ip.dart';

import '../models/register_model.dart';

class RegisterService {
  final Dio _dio;

  RegisterService(this._dio);

  Future<RegisterModel> register(String email, String phone, String fullName,
      String cedula, String username, int gender, String password) async {
    try {
      final response = await _dio.post(
        "$ip/register",
        data: {
          "username": username,
          "pw": password,
          "email": email,
          "cedula": cedula,
          "telefono": phone,
          "id_sexo": gender,
          "full_name": fullName,
        },
      );
      final resp = RegisterModel.fromJson(response.data);
      return resp;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return RegisterModel(
            status: "ERROR", message: "Error del servidor", data: null);
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        return RegisterModel(
            status: "ERROR", message: "Sin conexión a internet", data: null);
      }
      return RegisterModel(status: "ERROR", message: "Error $e", data: null);
    }
  }
}
