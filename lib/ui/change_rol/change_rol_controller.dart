import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_app/models/tipo_usuario_model.dart';
import 'package:login_app/models/usuarios_model.dart';
import 'package:login_app/services/get_tipo_usuario_service.dart';
import 'package:login_app/services/get_usuario_service.dart';
import 'package:login_app/services/update_rol_service.dart';

import '../../widgets/global_alert.dart';
import '../../widgets/global_loading.dart';

class ChangeRolController extends ChangeNotifier {
  final Dio _dio = Dio();
  
  List<Usuario>? usuarios = [];
  int usuarioValue = 0;

  List<TipoUsuario>? tipoUsuarios = [];
  int tipoUsuariosValue = 0;

  String? validateUsuario(int? usuario){
    notifyListeners();
    if(usuario != null){
      return null;
    }
    return "Usuario es requerido";
  }
  
  String? validateTipoUsuario(int? tipoUsuario){
    notifyListeners();
    if(tipoUsuario != null){
      return null;
    }
    return "Tipo de usuario es requerido";
  }

  bool enableButton(){
    if(usuarioValue != 0 &&
      tipoUsuariosValue != 0){

      return true;
    }
    return false;
  }

  void loadUsuarios(BuildContext context) async {
    final GetUsuarioService getUsuarios = GetUsuarioService(_dio);

    try {
      final response = await getUsuarios.getUsuario();
      usuarios = response!.data;
      notifyListeners();
    } catch (e) {
      log('$e');
    }

    loadTipoUsuarios(context);
  }

  void loadTipoUsuarios(BuildContext context) async {
    final GetTipoUsuarioService getTipoUsuario = GetTipoUsuarioService(_dio);

    try {
      final response = await getTipoUsuario.getTipoUsuario();
      tipoUsuarios = response!.data;
      notifyListeners();
    } catch (e) {
      log('$e');
    }
  }

  Future<void> register(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final UpdateRolService updateRolService = UpdateRolService(_dio);

    try {
      globalLoading(context);
      final response = await updateRolService.updateRol(usuarioValue, tipoUsuariosValue);
      Navigator.of(context).pop();
      if(response!.status == "SUCCESS"){
        globalAlert(context, msg: 'Información actualizada exitosamente', title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
      } else {
        globalAlert(context, msg: 'Error al actualizar la información', title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      log('$e');
    }

    Navigator.of(context).pop();
    globalAlert(context, msg: 'Usuario cambiado exitosamente', title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
  }
}