import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/unidad_model.dart';
import 'utils/global_ip.dart';

class RegisterUnidadService {
  final Dio _dio;

  RegisterUnidadService(this._dio);

  Future<UnidadModel?> registerUnidad(String nbUnidad, String placaUnidad, int yearUnidad, int idModelo) async {
    try {
      final response = await _dio.post("$ip/registerUnidad", data: {
        "nb_unidad": nbUnidad,
        "placa_unidad": placaUnidad,
        "year_unidad": yearUnidad,
        "id_modelo": idModelo,
      });

      if(response.statusCode == 200){
        return UnidadModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log("$e");
      return null;
    }
  }
}