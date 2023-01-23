import 'package:dio/dio.dart';

import '../models/tipo_usuario_model.dart';
import 'utils/global_ip.dart';

class GetTipoUsuarioService{
  final Dio _dio;

  GetTipoUsuarioService(this._dio);

  Future<TipoUsuarioModel?> getTipoUsuario() async {
    try {
      final response = await _dio.get('$ip/getTipoUsuario',);
      
      if(response.statusCode == 200){
        return TipoUsuarioModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }  
}
