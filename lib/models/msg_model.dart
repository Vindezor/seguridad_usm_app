class MsgModel {
    MsgModel({
        required this.status,
        required this.msg,
    });

    String status;
    String? msg;

    factory MsgModel.fromJson(Map<String, dynamic> json) => MsgModel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": msg,
    };
}