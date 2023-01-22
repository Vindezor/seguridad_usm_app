// To parse this JSON data, do
//
//     final listaModel = listaModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MarcaModel listaModelFromJson(String str) => MarcaModel.fromJson(json.decode(str));

String listaModelToJson(MarcaModel data) => json.encode(data.toJson());

class MarcaModel {
    MarcaModel({
        required this.status,
        required this.msg,
        required this.data,
    });

    String status;
    String? msg;
    List<Marca>? data;

    factory MarcaModel.fromJson(Map<String, dynamic> json) => MarcaModel(
        status: json["status"],
        msg: json["msg"],
        data: (json["data"] == null) ? null : List<Marca>.from(json["data"].map((marca) => Marca.fromJson(marca))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": msg,
        "data": (data == null) ? null : List<Marca>.from(data!.map((e) => e.toJson())),
    };
}

class Marca {
    Marca({
        required this.id,
        required this.marca,
    });

    int id;
    String marca;

    factory Marca.fromJson(Map<String, dynamic> json) => Marca(
        id: json["id_marca"],
        marca: json["nb_marca"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "marca": marca,
    };
}