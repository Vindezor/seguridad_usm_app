import 'package:dio/dio.dart';

import '../models/msg_model.dart';
import 'utils/global_ip.dart';

class UpdateRolService{
  final Dio _dio;

  UpdateRolService(this._dio);

  Future<MsgModel?> updateRol(int idUsuario, int idTipoUsuario) async {
    try {
      final response = await _dio.post('$ip/updateRol', data: {
        "id_usuario": idUsuario,
        "id_tipo_usuario": idTipoUsuario,
      });
      
      if(response.statusCode == 200){
        return MsgModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }  
}