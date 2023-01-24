// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    Data? data;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.username,
        required this.correo,
        required this.cedula,
        required this.fullName,
        required this.telefono,
        required this.tipoUsuario,
    });

    int id;
    String username;
    String correo; 
    int cedula;
    String fullName;
    String telefono;
    String tipoUsuario;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id_usuario"],
        cedula: json["cedula_usuario"],
        correo: json["correo_usuario"],
        fullName: json["full_name_usuario"],
        telefono: json["telefono_usuario"],
        tipoUsuario: json["nb_tipo_usuario"],
        username: json["username_usuario"],
    );

    Map<String, dynamic> toJson() => {
        "id_usuario": id,
        "cedula_usuario": cedula,
        "correo_usuario": correo,
        "full_name_usuario": fullName,
        "telefono_usuario": telefono,
        "nb_tipo_usuario": tipoUsuario,
        "username_usuario": username,
    };
}
