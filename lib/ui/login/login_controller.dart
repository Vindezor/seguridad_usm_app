import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/routes/routes.dart';
import 'package:login_app/widgets/global_loading.dart';

import '../../services/login_service.dart';
import '../../widgets/global_alert.dart';

class LoginController extends ChangeNotifier {
  final _dio = Dio();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final storage = const FlutterSecureStorage();

  RegExp usernameRegExp = RegExp(r'^[A-Za-z0-9]{5,}$');
  RegExp passwordRegExp = RegExp(
      r'^(?=.*[\d])(?=.*[A-Z])(?=.*[a-z])(?=.*[\.,!@#$%^&*])[\w\.,!@#$%^&*]{8,}$');

  bool hidePassword = true;

  String? validateUsername(String? username) {
    notifyListeners();
    if (username != null) {
      if (usernameRegExp.hasMatch(username)) {
        return null;
      }
    }
    return "Usuario invalido";
  }

  String? validatePassword(String? password) {
    notifyListeners();
    if (password != null) {
      if (passwordRegExp.hasMatch(password)) {
        return null;
      }
    }
    return "Clave invalida";
  }

  void changeHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  bool enableButton() {
    if (usernameRegExp.hasMatch(usernameController.text) &&
        passwordRegExp.hasMatch(passwordController.text)) {
      return true;
    }
    return false;
  }

  Future<void> login(BuildContext context) async {
    final LoginService loginService = LoginService(_dio);

    try {
      globalLoading(context);
      final response = await loginService.login(
          usernameController.text, passwordController.text);

      Navigator.of(context).pop();
      if (response.status == 'SUCCESS') {
        await storage.write(key: 'id_usuario', value: '${response.data!.id}');
        await storage.write(
            key: 'username_usuario', value: response.data!.username);
        await storage.write(
            key: 'correo_usuario', value: response.data!.correo);
        await storage.write(
            key: 'cedula_usuario', value: '${response.data!.cedula}');
        await storage.write(
            key: 'full_name_usuario', value: response.data!.fullName);
        await storage.write(
            key: 'telefono_usuario', value: response.data!.telefono);
        await storage.write(
            key: 'tipo_usuario_usuario', value: response.data!.tipoUsuario);
        usernameController.clear();
        passwordController.clear();

        if (response.data!.tipoUsuario == 'Estudiante') {
          Navigator.of(context).pushReplacementNamed(Routes.home);
        } else if (response.data!.tipoUsuario == 'Administrador') {
          Navigator.of(context).pushReplacementNamed(Routes.adminHome);
        } else {
          Navigator.of(context).pushReplacementNamed(Routes.blockedUser);
        }
        notifyListeners();
      } else {
        globalAlert(context, msg: response.msg, title: "Error");
      }
    } catch (e) {
      log('$e');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
