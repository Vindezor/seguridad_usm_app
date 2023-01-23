import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/modelo_model.dart';
import 'utils/global_ip.dart';

class RegisterModeloService {
  final Dio _dio;

  RegisterModeloService(this._dio);

  Future<ModeloModel?> registerModelo(String nbModelo, int idMarca) async {
    try {
      final response = await _dio.post("$ip/registerModelo", data: {
        "nb_modelo": nbModelo,
        "id_marca": idMarca,
      });

      if(response.statusCode == 200){
        return ModeloModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log("$e");
      return null;
    }
  }
}