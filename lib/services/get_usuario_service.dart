import 'package:dio/dio.dart';

import '../models/usuarios_model.dart';
import 'utils/global_ip.dart';

class GetUsuarioService{
  final Dio _dio;

  GetUsuarioService(this._dio);

  Future<UsuariosModel?> getUsuario() async {
    try {
      final response = await _dio.get('$ip/getUsers',);
      
      if(response.statusCode == 200){
        return UsuariosModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }  
}
