import 'package:dio/dio.dart';

import '../models/usuarios_model.dart';
import 'utils/global_ip.dart';

class GetChoferService{
  final Dio _dio;

  GetChoferService(this._dio);

  Future<UsuariosModel?> getChofer() async {
    try {
      final response = await _dio.get('$ip/getChofer',);
      
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
