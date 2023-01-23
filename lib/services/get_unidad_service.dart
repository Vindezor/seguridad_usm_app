import 'package:dio/dio.dart';

import '../models/unidad_model.dart';
import 'utils/global_ip.dart';

class GetUnidadService{
  final Dio _dio;

  GetUnidadService(this._dio);

  Future<UnidadModel?> getUnidad() async {
    try {
      final response = await _dio.get('$ip/getUnidad',);
      
      if(response.statusCode == 200){
        return UnidadModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }  
}