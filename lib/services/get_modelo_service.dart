import 'package:dio/dio.dart';

import '../models/modelo_model.dart';
import 'utils/global_ip.dart';

class GetModeloService{
  final Dio _dio;

  GetModeloService(this._dio);

  Future<ModeloModel?> getModelo() async {
    try {
      final response = await _dio.get('$ip/getModelo',);
      
      if(response.statusCode == 200){
        return ModeloModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }  
}
