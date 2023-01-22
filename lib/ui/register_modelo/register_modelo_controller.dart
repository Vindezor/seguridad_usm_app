import 'package:flutter/cupertino.dart';
import 'package:login_app/models/marca_model.dart';

import '../../widgets/global_alert.dart';
import '../../widgets/global_loading.dart';

class RegisterModeloController extends ChangeNotifier {
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
    globalLoading(context);
    Navigator.of(context).pop();
    globalAlert(context, msg: 'Modelo registrado exitosamente', title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
    // final response = await RegisterService(Dio()).register(
    //   emailController.text,
    //   phoneController.text,
    //   fullNameController.text,
    //   cedulaController.text,
    //   usernameController.text,
    //   genderValue,
    //   passwordController.text,
    // );
    // if(response.status == "ERROR"){
    //   Navigator.of(context).pop();
    //   globalAlert(context, msg: response.message, title: "Importante");
    // }else{
    //   Navigator.of(context).pop();
    //   globalAlert(
    //     context,
    //     msg: response.message,
    //     title: "Importante",
    //     closeOnPressed: () {
    //       Navigator.of(context).pop();
    //       Navigator.of(context).pop();
    //     }
    //   );
    // }
  }

  void loadMarca(BuildContext context) async {
    //final GetGenderService getGender = GetGenderService(_dio);
    // try {
    //   //globalLoading(context);
    //   final response = await getGender.getGender();
    //   generos = response!.data;
    //   //Navigator.of(context).pop();
    //   notifyListeners();
    // } catch (e) {
    //   //Navigator.of(context).pop();
    //   // globalAlert(
    //   //   context,
    //   //   msg: 'Disculpe, la plataforma no se encuentra disponible',
    //   //   title: 'Importante',
    //   //   closeOnPressed: () {
    //   //     Navigator.of(context).pop();
    //   //     Navigator.of(context).pop();
    //   //   }
    //   // );
    //   log('$e');
    // }

    marcas = [
      Marca(id: 1, marca: 'Encava')
    ];
    notifyListeners();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    modeloController.dispose();
    super.dispose();
  }
}