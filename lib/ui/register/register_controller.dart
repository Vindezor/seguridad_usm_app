import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/routes/routes.dart';
import 'package:login_app/services/get_gender.dart';
import 'package:login_app/widgets/global_loading.dart';

import '../../models/gender_model.dart';
import '../../services/login_service.dart';
import '../../services/register_service.dart';
import '../../widgets/global_alert.dart';

class RegisterController extends ChangeNotifier{
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController cedulaController = TextEditingController();

  final storage = const FlutterSecureStorage();

  final Dio _dio = Dio();

  RegExp usernameRegExp = RegExp(r'^[A-Za-z0-9]{5,}$');
  RegExp passwordRegExp = RegExp(
    r'^(?=.*[\d])(?=.*[A-Z])(?=.*[a-z])(?=.*[\.,!@#$%^&*])[\w\.,!@#$%^&*]{8,}$'
  );
  RegExp emailRegExp = RegExp(
    r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'''
  );
  RegExp phoneRegExp = RegExp(r'^[0-9()\- ]{14}$');
  RegExp fullNameRegExp = RegExp(r'^[a-zA-Z ]{5,}$');
  RegExp cedulaRegExp = RegExp(r'^[0-9]{7,9}$');

  bool hidePassword = true;
  
  List<Gender>? generos = [];
  int genderValue = 0;
  String? validateGender(int? gender){
    notifyListeners();
    if(gender != null){
      return null;
    }
    return "Genero invalido";
  }

  String? validateEmail(String? email){
    notifyListeners();
    if(email != null){
      if(emailRegExp.hasMatch(email)){
        return null;
      }
    } 
    return "Correo invalido";
  }

  String? validateCedula(String? cedula){
    notifyListeners();
    if(cedula != null){
      if(cedulaRegExp.hasMatch(cedula)){
        return null;
      }
    } 
    return "Cedula invalida";
  }


  String? validateFullName(String? fullName){
    notifyListeners();
    if(fullName != null){
      if(fullNameRegExp.hasMatch(fullName)){
        return null;
      }
    }
    return "Nombre Completo invalido";
  }

  String? validateUsername(String? username){
    notifyListeners();
    if(username != null){
      if(usernameRegExp.hasMatch(username)){
        return null;
      }
    } 
    return "Usuario invalido";
  }

  String? validatePhone(String? phone){
    notifyListeners();
    if(phone != null){
      log(phone);
      if(phoneRegExp.hasMatch(phone)){
        return null;
      }
      if(phone.length > 1){
        if(phone[1] == '0'){
          phoneController.clear();
          return "Telefono inválido";
        }
      }
    }
    return "Telefono inválido";
  }

  String? validatePassword(String? password){
    notifyListeners();
    if(password != null){
      if(passwordRegExp.hasMatch(password)){
        return null;
      }
    } 
    return "Clave invalida";
  }

  void changeHidePassword(){
    hidePassword = !hidePassword;
    notifyListeners();
  }

  bool enableButton(){
    if(usernameRegExp.hasMatch(usernameController.text) && 
      passwordRegExp.hasMatch(passwordController.text) &&
      emailRegExp.hasMatch(emailController.text) &&
      phoneRegExp.hasMatch(phoneController.text) &&
      genderValue != 0){
      
      return true;
    }
    return false;
  }

  Future<void> register(BuildContext context) async {
    globalLoading(context);
    final response = await RegisterService(Dio()).register(
      emailController.text,
      phoneController.text,
      fullNameController.text,
      cedulaController.text,
      usernameController.text,
      genderValue,
      passwordController.text,
    );
    if(response.status == "ERROR"){
      Navigator.of(context).pop();
      globalAlert(context, msg: response.message, title: "Importante");
    }else{
      Navigator.of(context).pop();
      globalAlert(
        context,
        msg: response.message,
        title: "Importante",
        closeOnPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      );
    }
  }

  void loadGender(BuildContext context) async {
    final GetGenderService getGender = GetGenderService(_dio);
    try {
      //globalLoading(context);
      final response = await getGender.getGender();
      generos = response!.data;
      //Navigator.of(context).pop();
      notifyListeners();
    } catch (e) {
      //Navigator.of(context).pop();
      // globalAlert(
      //   context,
      //   msg: 'Disculpe, la plataforma no se encuentra disponible',
      //   title: 'Importante',
      //   closeOnPressed: () {
      //     Navigator.of(context).pop();
      //     Navigator.of(context).pop();
      //   }
      // );
      log('$e');
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    fullNameController.dispose();
    cedulaController.dispose();

    super.dispose();
  }
}