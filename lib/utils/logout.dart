import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_app/routes/routes.dart';
import 'package:login_app/widgets/global_alert.dart';

void logout(BuildContext context){
  const FlutterSecureStorage storage = FlutterSecureStorage();
  globalAlert(
    context,
    msg: "¿Seguro que desea cerrar sesión?",
    title: "Importante",
    acceptOnPressed: () async {
      await storage.delete(key: 'id_usuario');
      await storage.delete(key: 'username_usuario');
      await storage.delete(key: 'correo_usuario');
      await storage.delete(key: 'cedula_usuario');
      await storage.delete(key: 'full_name_usuario');
      await storage.delete(key: 'telefono_usuario');
      await storage.delete(key: 'tipo_usuario_usuario');
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.login,
        (route) => false
      );
    }
  );
}