// To parse this JSON data, do
//
//     final listaModel = listaModelFromJson(jsonString);

import 'dart:convert';

GenderModel listaModelFromJson(String str) => GenderModel.fromJson(json.decode(str));

String listaModelToJson(GenderModel data) => json.encode(data.toJson());

class GenderModel {
    GenderModel({
        required this.status,
        required this.msg,
        required this.data,
    });

    String status;
    String? msg;
    List<Gender>? data;

    factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
        status: json["status"],
        msg: json["msg"],
        data: (json["data"] == null) ? null : List<Gender>.from(json["data"].map((gender) => Gender.fromJson(gender))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": msg,
        "data": (data == null) ? null : List<Gender>.from(data!.map((e) => e.toJson())),
    };
}

class Gender {
    Gender({
        required this.id,
        required this.gender,
    });

    int id;
    String gender;

    factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["id_sexo"],
        gender: json["nb_sexo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "gender": gender,
    };
}