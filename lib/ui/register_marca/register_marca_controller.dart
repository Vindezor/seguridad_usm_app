import 'package:flutter/cupertino.dart';

import '../../widgets/global_alert.dart';
import '../../widgets/global_loading.dart';

class RegisterMarcaController extends ChangeNotifier {
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
    globalLoading(context);
    Navigator.of(context).pop();
    globalAlert(context, msg: 'Marca registrada exitosamente', title: "Importante", closeOnPressed: () {
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

  @override
  void dispose() {
    // TODO: implement dispose
    marcaController.dispose();
    super.dispose();
  }
}