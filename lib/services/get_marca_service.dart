import 'package:dio/dio.dart';

import '../models/marca_model.dart';
import 'utils/global_ip.dart';

class GetMarcaService{
  final Dio _dio;

  GetMarcaService(this._dio);

  Future<MarcaModel?> getMarca() async {
    try {
      final response = await _dio.get('$ip/getMarca',);
      
      if(response.statusCode == 200){
        return MarcaModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }  
}
