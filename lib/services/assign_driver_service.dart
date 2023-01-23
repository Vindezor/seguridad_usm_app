import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:login_app/models/msg_model.dart';
import 'package:login_app/services/utils/global_ip.dart';

class AssignDriverService {
  final Dio _dio;

  AssignDriverService(this._dio);

  Future<MsgModel?> assignDriver(int idUsuario, int idUnidad) async {
    try {
      final response = await _dio.post("$ip/assignChofer", data: {
        "id_usuario": idUsuario,
        "id_unidad": idUnidad,
      });

      if(response.statusCode == 200){
        return MsgModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log("$e");
      return null;
    }
  }
}