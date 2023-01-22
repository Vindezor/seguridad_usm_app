import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/models/modelo_model.dart';
import 'package:login_app/widgets/global_alert.dart';

import '../../models/marca_model.dart';
import '../../widgets/global_loading.dart';

class RegisterUnidadController extends ChangeNotifier {
  TextEditingController nombreUnidadController = TextEditingController();
  TextEditingController placaUnidadController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  int yearValue = 0;

  List<Marca>? marcas = [];
  int marcaValue = 0;

  List<Modelo>? modelos = [];
  int modeloValue = 0;

  RegExp nombreUnidadRegExp = RegExp(r'^[a-zA-Z ]{5,}$');
  RegExp placaUnidadRegExp = RegExp(r'^[a-zA-Z0-9]{6,7}$');

  String? validateMarca(int? marca){
    notifyListeners();
    if(marca != null){
      return null;
    }
    return "Marca es requerida";
  }

  String? validateYear(String? year){
    notifyListeners();
    if(year != ''){
      return null;
    }
    return "Año es requerido";
  }


  String? validateModelo(int? modelo){
    notifyListeners();
    if(modelo != null){
      return null;
    }
    return "Modelo es requerido";
  }

  String? validateNombreUnidad(String? nombreUnidad){
    notifyListeners();
    if(nombreUnidad != null){
      if(nombreUnidadRegExp.hasMatch(nombreUnidad)){
        return null;
      }
    }
    return "Nombre Completo invalido";
  }

  String? validatePlacaUnidad(String? placaUnidad){
    notifyListeners();
    if(placaUnidad != null){
      if(placaUnidadRegExp.hasMatch(placaUnidad)){
        return null;
      }
    }
    return "Placa invalida";
  }


  bool enableButton(){
    if(placaUnidadRegExp.hasMatch(placaUnidadController.text) &&
      nombreUnidadRegExp.hasMatch(nombreUnidadController.text) &&
      modeloValue != 0 &&
      marcaValue != 0 &&
      yearValue != 0){

      return true;
    }
    return false;
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
    loadModelo(context);
    notifyListeners();
  }

  void loadModelo(BuildContext context) async {
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

    modelos = [
      Modelo(id: 1, modelo: 'ENT 610')
    ];
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    globalLoading(context);
    Navigator.of(context).pop();
    globalAlert(context, msg: 'Unidad registrada exitosamente', title: "Importante", closeOnPressed: () {
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

  void handleReadOnlyInputClick(BuildContext context, GlobalKey<FormState> formKey) {
    showBottomSheet(
        context: context,
        builder: (BuildContext context) => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 100,
          child: YearPicker(
            selectedDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 100),
            lastDate: DateTime.now(),
            onChanged: (val) {
              yearController.text = val.year.toString();
              yearValue = val.year;
              Navigator.pop(context);
              if(formKey.currentState != null){
                formKey.currentState!.validate();
              }
              notifyListeners();
            },
          ),
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    yearController.dispose();
    nombreUnidadController.dispose();
    placaUnidadController.dispose();
    super.dispose();
  }
}