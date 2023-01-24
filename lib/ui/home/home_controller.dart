import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/services/get_gender_service.dart';
import 'package:login_app/widgets/global_loading.dart';

import '../../models/gender_model.dart';
import '../../services/emergencia_service.dart';
import '../../widgets/global_alert.dart';

class HomeController extends ChangeNotifier{
  // bool isSnackbarShowing = false;
  // bool isError = false;
  // bool isLoading = false;
  // Data? dataList;
  // List<ListItem> toDoList = [];
  final _dio = Dio();
  // final storage = const FlutterSecureStorage();

  // // void addItem(String text, BuildContext context) async {
  // //   final UpdateListService updateList = UpdateListService(_dio);
  // //   final response = await updateList.updateList;
  // //   if (response != null) {
  // //     toDoList.add(ListItem(id: response, text: text));
  // //     notifyListeners();
  // //   } else {
  // //     showSnackbar(context);
  // //   }
  // // }

  // void editItem(String id, String text, int index, BuildContext context) async {
  //   globalLoading(context);
  //   dataList!.lista[index] = Lista(id: id,data: text);
  //   final UpdateListService updateList = UpdateListService(_dio);
  //   final response = await updateList.updateList(dataList!);
  //   if (response.status == "SUCCESS") {
  //     toDoList[index] = ListItem(id: id, text: text);
  //     notifyListeners();
  //   } else {
  //     showSnackbar(context);
  //   }
  //   Navigator.pop(context);
  // }

  // void deleteItem(String id, BuildContext context) async {
  //   globalLoading(context);
  //   dataList!.lista = dataList!.lista.where((element) => element.id != id).toList();
  //   final UpdateListService updateList = UpdateListService(_dio);
  //   final response = await updateList.updateList(dataList!);
  //   if (response.status == "SUCCESS") {
  //     loadList();
  //     notifyListeners();
  //   } else {
  //     showSnackbar(context);
  //   }
  //   Navigator.pop(context);
  // }

  // void addItem(String text, BuildContext context) async {
  //   try{
  //     globalLoading(context);
  //     if(dataList == null){
  //       final id = await storage.read(key: 'id');
  //       dataList = Data(id: id!, lista: [Lista(data: text)]);
  //     }
  //     else{
  //       dataList!.lista.add(Lista(data: text));
  //     }
  //     final UpdateListService updateList = UpdateListService(_dio);
  //     final response = await updateList.updateList(dataList!);
  //     if (response.status == "SUCCESS") {
  //       loadList();
  //       notifyListeners();
  //     } else {
  //       showSnackbar(context);
  //     }
  //     Navigator.pop(context);
  //   } catch (e){
  //     log("$e");
  //   }
  // }

  // // void deleteItem(ListItem item, BuildContext context) async {
  // //   final response = await delFromList(item.id);
  // //   if (response == true) {
  // //     toDoList.remove(item);
  // //     notifyListeners();
  // //   } else {
  // //     showSnackbar(context);
  // //   }
  // // }

  // void showSnackbar(BuildContext context){
  //   if (!isSnackbarShowing) {
  //     isSnackbarShowing = true;
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: Colors.black26,
  //         content: Text(
  //           "Error de conexion",
  //           textAlign: TextAlign.center,
  //         )
  //       )
  //     ).closed.then((value) => isSnackbarShowing = false);
  //   }
  // }

  // void loadList() async {
  //   final GetListService getList = GetListService(_dio);
  //   try {
  //     isError = false;
  //     isLoading = true;
  //     notifyListeners();
  //     final response = await getList.getLista();
  //     dataList = response!.data;
  //     if(dataList != null){
  //       toDoList = response.data!.lista.map((e) => ListItem(id: e.id!, text: e.data)).toList();
  //     }
  //     isLoading = false;
  //     notifyListeners();
  //   } catch (e) {
  //     log("$e");
  //     isError = true;
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }

  // List<String> getStringItems(){
  //   final items = toDoList.map((e) => e.text).toList();
  //   return items;
  // }

  Future<void> emergencia(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final EmergenciaService emergenciaService = EmergenciaService(_dio);

    try {
      globalLoading(context);
      final response = await emergenciaService.emergencia('prueba', 'prueba@gmail.com', '10.474139, -66.831494', '42242715167');
      Navigator.of(context).pop();
      if(response!.status == "SUCCESS"){
        globalAlert(context, msg: response.msg!, title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
        });
      } else {
        globalAlert(context, msg: response.msg!, title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      log('$e');
      globalAlert(context, msg: "Error al enviar correo", title: "Importante", closeOnPressed: () {
          Navigator.of(context).pop();
        });
    }
  }
}