import 'package:dio/dio.dart';
import 'package:login_app/services/utils/global_ip.dart';

import '../models/gender_model.dart';

class GetGenderService{
  final Dio _dio;

  GetGenderService(this._dio);

  Future<GenderModel?> getGender() async {
    try {
      final response = await _dio.get('$ip/getGender',);
      
      if(response.statusCode == 200){
        return GenderModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }  
}
