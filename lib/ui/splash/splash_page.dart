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
        // final String? username = await storage.read(key: 'username');
        // final String? id = await storage.read(key: 'id');

        // if(username != null && id != null){
        //   Navigator.of(context).pushReplacementNamed(Routes.home);
        // } else {
        //   Navigator.of(context).pushReplacementNamed(Routes.login);
        // }
        Navigator.of(context).pushReplacementNamed(Routes.login);
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