// To parse this JSON data, do
//
//     final listaModel = listaModelFromJson(jsonString);

import 'dart:convert';

TipoUsuarioModel listaModelFromJson(String str) => TipoUsuarioModel.fromJson(json.decode(str));

String listaModelToJson(TipoUsuarioModel data) => json.encode(data.toJson());

class TipoUsuarioModel {
    TipoUsuarioModel({
        required this.status,
        required this.msg,
        required this.data,
    });

    String status;
    String? msg;
    List<TipoUsuario>? data;

    factory TipoUsuarioModel.fromJson(Map<String, dynamic> json) => TipoUsuarioModel(
        status: json["status"],
        msg: json["msg"],
        data: (json["data"] == null) ? null : List<TipoUsuario>.from(json["data"].map((tipoUsuario) => TipoUsuario.fromJson(tipoUsuario))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": msg,
        "data": (data == null) ? null : List<TipoUsuario>.from(data!.map((e) => e.toJson())),
    };
}

class TipoUsuario {
    TipoUsuario({
        required this.id,
        required this.tipoUsuario,
    });

    int id;
    String tipoUsuario;

    factory TipoUsuario.fromJson(Map<String, dynamic> json) => TipoUsuario(
        id: json["id_tipo_usuario"],
        tipoUsuario: json["nb_tipo_usuario"],
    );

    Map<String, dynamic> toJson() => {
        "id_tipo_suario": id,
        "nb_tipo_usuario": tipoUsuario,
    };
}