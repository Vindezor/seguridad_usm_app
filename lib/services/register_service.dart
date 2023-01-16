import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:login_app/models/login_model.dart';
import 'package:login_app/services/utils/global_ip.dart';

import '../models/register_model.dart';

class RegisterService{
  final Dio _dio;

  RegisterService(this._dio);

  Future<RegisterModel> register(String email, String phone, String fullName, String cedula, String username, int gender, String password)async {
    try{
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
    } on DioError catch(e){
      if(e.type == DioErrorType.connectTimeout){
        return RegisterModel(status: "ERROR", message: "Error del servidor", data: null);
      }
      if(e.type == DioErrorType.other){
        return RegisterModel(status: "ERROR", message: "Sin conexión a internet", data: null);
      }
      return RegisterModel(status: "ERROR", message: "Error $e", data: null);
    }
  }
}