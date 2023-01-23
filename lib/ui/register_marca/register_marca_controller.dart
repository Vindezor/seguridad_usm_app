import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_app/services/register_marca_service.dart';

import '../../widgets/global_alert.dart';
import '../../widgets/global_loading.dart';

class RegisterMarcaController extends ChangeNotifier {
  final _dio = Dio();

  TextEditingController marcaController = TextEditingController();

  RegExp marcaRegExp = RegExp(r'^[A-Za-z ]{2,}$');
  
  String? validateMarca(String? marca){
    notifyListeners();
    if(marca != null){
      if(marcaRegExp.hasMatch(marca)){
        return null;
      }
    } 
    return "Marca invalida";
  }

  bool enableButton(){
    if(marcaRegExp.hasMatch(marcaController.text)){
      return true;
    }
    return false;
  }

  Future<void> register(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final RegisterMarcaService registerMarcaService = RegisterMarcaService(_dio);

    try {
      globalLoading(context);
      final response = await registerMarcaService.registerMarca(marcaController.text);
      Navigator.of(context).pop();
      if(response!.status == "SUCCESS"){
        globalAlert(context, msg: 'Marca registrada exitosamente', title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
      } else {
        globalAlert(context, msg: response.msg!, title: "Error", closeOnPressed: () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      log('$e');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    marcaController.dispose();
    super.dispose();
  }
}