// To parse this JSON data, do
//
//     final listaModel = listaModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UnidadModel listaModelFromJson(String str) => UnidadModel.fromJson(json.decode(str));

String listaModelToJson(UnidadModel data) => json.encode(data.toJson());

class UnidadModel {
    UnidadModel({
        required this.status,
        required this.msg,
        required this.data,
    });

    String status;
    String? msg;
    List<Unidad>? data;

    factory UnidadModel.fromJson(Map<String, dynamic> json) => UnidadModel(
        status: json["status"],
        msg: json["msg"],
        data: (json["data"] == null) ? null : List<Unidad>.from(json["data"].map((unidad) => Unidad.fromJson(unidad))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": msg,
        "data": (data == null) ? null : List<Unidad>.from(data!.map((e) => e.toJson())),
    };
}

class Unidad {
    Unidad({
        required this.id,
        required this.nombre,
        required this.placa,
        required this.year,
        required this.idModelo,
    });

    int id;
    String nombre;
    String placa;
    int year;
    int idModelo;

    factory Unidad.fromJson(Map<String, dynamic> json) => Unidad(
        id: json["id_unidad"],
        nombre: json["nb_unidad"],
        placa: json["placa_unidad"],
        year: json["year_unidad"],
        idModelo: json["id_modelo"],
    );

    Map<String, dynamic> toJson() => {
        "id_unida": id,
        "nb_unidad": nombre,
        "placa_unidad": placa,
        "year_unidad": year,
        "id_modelo": idModelo,
    };
}