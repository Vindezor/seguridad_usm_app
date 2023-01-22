// To parse this JSON data, do
//
//     final listaModel = listaModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModeloModel listaModelFromJson(String str) => ModeloModel.fromJson(json.decode(str));

String listaModelToJson(ModeloModel data) => json.encode(data.toJson());

class ModeloModel {
    ModeloModel({
        required this.status,
        required this.msg,
        required this.data,
    });

    String status;
    String? msg;
    List<Modelo>? data;

    factory ModeloModel.fromJson(Map<String, dynamic> json) => ModeloModel(
        status: json["status"],
        msg: json["msg"],
        data: (json["data"] == null) ? null : List<Modelo>.from(json["data"].map((modelo) => Modelo.fromJson(modelo))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": msg,
        "data": (data == null) ? null : List<Modelo>.from(data!.map((e) => e.toJson())),
    };
}

class Modelo {
    Modelo({
        required this.id,
        required this.modelo,
    });

    int id;
    String modelo;

    factory Modelo.fromJson(Map<String, dynamic> json) => Modelo(
        id: json["id_modelo"],
        modelo: json["nb_modelo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "modelo": modelo,
    };
}