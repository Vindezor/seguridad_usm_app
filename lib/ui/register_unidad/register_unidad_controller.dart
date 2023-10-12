import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_app/models/modelo_model.dart';
import 'package:login_app/services/register_unidad_service.dart';
import 'package:login_app/widgets/global_alert.dart';

import '../../models/marca_model.dart';
import '../../services/get_marca_service.dart';
import '../../services/get_modelo_service.dart';
import '../../widgets/global_loading.dart';

class RegisterUnidadController extends ChangeNotifier {
  final _dio = Dio();

  TextEditingController nombreUnidadController = TextEditingController();
  TextEditingController placaUnidadController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  int yearValue = 0;

  List<Marca>? marcas = [];
  int marcaValue = 0;

  List<Modelo>? modelos = [];

  List<Modelo>? modelosAct = [];
  int modeloValue = 0;

  RegExp nombreUnidadRegExp = RegExp(r'^[a-zA-Z ]{5,}$');
  RegExp placaUnidadRegExp = RegExp(r'^[a-zA-Z0-9]{6,7}$');

  String? validateMarca(int? marca) {
    notifyListeners();
    if (marca != null) {
      return null;
    }
    return "Marca es requerida";
  }

  String? validateYear(String? year) {
    notifyListeners();
    if (year != '') {
      return null;
    }
    return "Año es requerido";
  }

  String? validateModelo(int? modelo) {
    notifyListeners();
    if (modelo != null) {
      return null;
    }
    return "Modelo es requerido";
  }

  String? validateNombreUnidad(String? nombreUnidad) {
    notifyListeners();
    if (nombreUnidad != null) {
      if (nombreUnidadRegExp.hasMatch(nombreUnidad)) {
        return null;
      }
    }
    return "Nombre Completo invalido";
  }

  String? validatePlacaUnidad(String? placaUnidad) {
    notifyListeners();
    if (placaUnidad != null) {
      if (placaUnidadRegExp.hasMatch(placaUnidad)) {
        return null;
      }
    }
    return "Placa invalida";
  }

  bool enableButton() {
    if (placaUnidadRegExp.hasMatch(placaUnidadController.text) &&
        nombreUnidadRegExp.hasMatch(nombreUnidadController.text) &&
        modeloValue != 0 &&
        marcaValue != 0 &&
        yearValue != 0) {
      return true;
    }
    return false;
  }

  void changeModelo(int idMarca) {
    if (modelos != null) {
      modelosAct =
          modelos!.where((element) => element.idMarca == idMarca).toList();
      modeloValue = 0;
      notifyListeners();
    }
  }

  void loadMarca(BuildContext context) async {
    final GetMarcaService getMarcaService = GetMarcaService(_dio);

    try {
      final response = await getMarcaService.getMarca();
      marcas = response!.data;

      loadModelo(context);
      notifyListeners();
    } catch (e) {
      log("$e");
    }
  }

  void loadModelo(BuildContext context) async {
    final GetModeloService getModeloService = GetModeloService(_dio);

    try {
      final response = await getModeloService.getModelo();
      modelos = response!.data;
      notifyListeners();
    } catch (e) {
      log("$e");
    }
  }

  Future<void> register(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final RegisterUnidadService registerUnidadService =
        RegisterUnidadService(_dio);

    try {
      globalLoading(context);
      final response = await registerUnidadService.registerUnidad(
          nombreUnidadController.text,
          placaUnidadController.text,
          yearValue,
          modeloValue);

      Navigator.of(context).pop();
      if (response!.status == "SUCCESS") {
        globalAlert(context,
            msg: 'Unidad registrada exitosamente',
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

  void handleReadOnlyInputClick(
      BuildContext context, GlobalKey<FormState> formKey) {
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
                  if (formKey.currentState != null) {
                    formKey.currentState!.validate();
                  }
                  notifyListeners();
                },
              ),
            ));
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
