// To parse this JSON data, do
//
//     final listaModel = listaModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UsuariosModel listaModelFromJson(String str) => UsuariosModel.fromJson(json.decode(str));

String listaModelToJson(UsuariosModel data) => json.encode(data.toJson());

class UsuariosModel {
    UsuariosModel({
        required this.status,
        required this.msg,
        required this.data,
    });

    String status;
    String? msg;
    List<Usuario>? data;

    factory UsuariosModel.fromJson(Map<String, dynamic> json) => UsuariosModel(
        status: json["status"],
        msg: json["msg"],
        data: (json["data"] == null) ? null : List<Usuario>.from(json["data"].map((usuarios) => Usuario.fromJson(usuarios))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": msg,
        "data": (data == null) ? null : List<Usuario>.from(data!.map((e) => e.toJson())),
    };
}

class Usuario {
    Usuario({
        required this.id,
        required this.username,
        required this.cedula,
        required this.idTipoUsuario,
    });

    int id;
    String username;
    int cedula;
    int idTipoUsuario;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id_usuario"],
        username: json["username_usuario"],
        cedula: json["cedula_usuario"],
        idTipoUsuario: json["id_tipo_usuario"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "cedula": cedula,
        "id_tipo_usuario": idTipoUsuario
    };
}