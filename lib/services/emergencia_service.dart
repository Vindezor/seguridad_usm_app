import 'package:dio/dio.dart';

import '../models/msg_model.dart';
import 'utils/global_ip.dart';

class EmergenciaService{
  final Dio _dio;

  EmergenciaService(this._dio);

  Future<MsgModel?> emergencia(String name, String email, String direccion, String phone) async {
    try {
      final response = await _dio.post('$ip/send-email', data: {
        "name": name,
        "email": email,
        "direccion": direccion,
        "phone": phone
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