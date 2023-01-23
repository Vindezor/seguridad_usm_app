import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_app/models/marca_model.dart';
import 'package:login_app/services/get_marca_service.dart';

import '../../services/register_modelo_service.dart';
import '../../widgets/global_alert.dart';
import '../../widgets/global_loading.dart';

class RegisterModeloController extends ChangeNotifier {
  final _dio = Dio();

  TextEditingController modeloController = TextEditingController();
  
  RegExp modeloRegExp = RegExp(r'^[A-Za-z0-9 \-]{2,}$');
  
  List<Marca>? marcas = [];
  int marcaValue = 0;

  String? validateMarca(int? marca){
    notifyListeners();
    if(marca != null){
      return null;
    }
    return "Marca invalida";
  }

  String? validateModelo(String? modelo){
    notifyListeners();
    if(modelo != null){
      if(modeloRegExp.hasMatch(modelo)){
        return null;
      }
    } 
    return "Modelo invalido";
  }

  bool enableButton(){
    if(modeloRegExp.hasMatch(modeloController.text) &&
      marcaValue != 0){

      return true;
    }
    return false;
  }

  Future<void> register(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final RegisterModeloService registerModeloService = RegisterModeloService(_dio);

    try {
      globalLoading(context);
      final response = await registerModeloService.registerModelo(modeloController.text, marcaValue);
      Navigator.of(context).pop();
      if(response!.status == "SUCCESS"){
        globalAlert(context, msg: 'Modelo registrado exitosamente', title: "Importante", closeOnPressed: () {
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

  void loadMarca(BuildContext context) async {
    final GetMarcaService getMarcaService = GetMarcaService(_dio);

    try {
      final response = await getMarcaService.getMarca();
      marcas = response!.data;
      notifyListeners();
    } catch (e) {
      log("$e");
    }
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    modeloController.dispose();
    super.dispose();
  }
}