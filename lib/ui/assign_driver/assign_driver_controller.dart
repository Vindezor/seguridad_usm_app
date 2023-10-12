import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_app/models/unidad_model.dart';
import 'package:login_app/services/get_chofer_service.dart';
import 'package:login_app/services/get_unidad_service.dart';

import '../../models/usuarios_model.dart';
import '../../services/assign_driver_service.dart';
import '../../widgets/global_alert.dart';
import '../../widgets/global_loading.dart';

class AssignDriverController extends ChangeNotifier {
  final _dio = Dio();

  List<Usuario>? usuarios = [];
  int usuarioValue = 0;

  List<Unidad>? unidades = [];
  int unidadesValue = 0;

  String? validateUsuario(int? usuario) {
    notifyListeners();
    if (usuario != null) {
      return null;
    }
    return "Usuario es requerido";
  }

  String? validateUnidad(int? unidad) {
    notifyListeners();
    if (unidad != null) {
      return null;
    }
    return "Tipo de usuario es requerido";
  }

  bool enableButton() {
    if (usuarioValue != 0 && unidadesValue != 0) {
      return true;
    }
    return false;
  }

  void loadUsuarios(BuildContext context) async {
    final GetChoferService getChoferService = GetChoferService(_dio);

    try {
      final response = await getChoferService.getChofer();
      usuarios = response!.data;

      loadUnidades(context);
      notifyListeners();
    } catch (e) {
      log("$e");
    }
  }

  void loadUnidades(BuildContext context) async {
    final GetUnidadService getUnidadService = GetUnidadService(_dio);

    try {
      final response = await getUnidadService.getUnidad();
      unidades = response!.data;
      notifyListeners();
    } catch (e) {
      log("$e");
    }
  }

  Future<void> register(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final AssignDriverService assignDriverService = AssignDriverService(_dio);

    try {
      globalLoading(context);
      final response =
          await assignDriverService.assignDriver(usuarioValue, unidadesValue);

      Navigator.of(context).pop();
      if (response!.status == "SUCCESS") {
        globalAlert(context,
            msg: 'Chofer asignado exitosamente',
            title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
      } else {
        globalAlert(context, msg: response.msg!, title: "Error",
            closeOnPressed: () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      log('$e');
    }
  }
}
