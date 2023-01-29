import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login_app/services/get_gender_service.dart';
import 'package:login_app/widgets/global_loading.dart';

import '../../models/gender_model.dart';
import '../../services/emergencia_service.dart';
import '../../widgets/global_alert.dart';

class HomeController extends ChangeNotifier{
  final _dio = Dio();
  final _storage = const FlutterSecureStorage();

  Future<void> emergencia(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final EmergenciaService emergenciaService = EmergenciaService(_dio);

    try {
      globalLoading(context);
      final name = await _storage.read(key: 'full_name_usuario');
      final email = await _storage.read(key: 'correo_usuario');
      final phone = await _storage.read(key: 'telefono_usuario');
      var cords = await Geolocator.getCurrentPosition();
      final response = await emergenciaService.emergencia(name!, email!, '${cords.latitude}, ${cords.longitude}', phone!);
      Navigator.of(context).pop();
      if(response!.status == "SUCCESS"){
        globalAlert(context, msg: response.msg!, title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
        });
      } else {
        globalAlert(context, msg: response.msg!, title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      log('$e');
      globalAlert(context, msg: "Error al enviar correo", title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
        });
    }
  }
}