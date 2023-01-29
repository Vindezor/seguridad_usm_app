import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/routes/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5)).then(
      (_) async {
        final String? tipoUsuario = await storage.read(key: 'tipo_usuario_usuario');
        // final String? id = await storage.read(key: 'id');

        if(tipoUsuario != null){
          if(tipoUsuario == 'Estudiante'){
            Navigator.of(context).pushReplacementNamed(Routes.home);
          } else if (tipoUsuario == 'Administrador') {
            Navigator.of(context).pushReplacementNamed(Routes.adminHome);
          }
        } else {
          Navigator.of(context).pushReplacementNamed(Routes.login);
        }
      }
    );
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffe1f0f5),
                Color(0xffa6dee9)
              ]
            )
          ),
          child: Center(
            child: Text(
              "Seguridad USM",
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 50
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}