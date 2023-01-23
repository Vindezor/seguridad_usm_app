import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:login_app/models/marca_model.dart';

import 'utils/global_ip.dart';

class RegisterMarcaService {
  final Dio _dio;

  RegisterMarcaService(this._dio);

  Future<MarcaModel?> registerMarca(String nbMarca) async {
    try {
      final response = await _dio.post("$ip/registerMarca", data: {
        "nb_marca": nbMarca,
      });

      if(response.statusCode == 200){
        return MarcaModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log("$e");
      return null;
    }
  }
}