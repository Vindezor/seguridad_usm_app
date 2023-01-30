import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/routes/routes.dart';
import 'package:login_app/widgets/global_alert.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  bool alertOpened = false;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // TODO: implement didChangeAppLifecycleState
    if(state == AppLifecycleState.resumed){
      var permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
        successLocation();
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  void successLocation() async {
    if(alertOpened){
      Navigator.pop(context);
    }
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

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5)).then(
      (_) async {
        var status = await Permission.camera.status;
          if (!status.isGranted) {
              await Permission.camera.request();
          }
        LocationPermission permission = await Geolocator.checkPermission();
        if(permission == LocationPermission.denied){
          permission = await Geolocator.requestPermission();
          if(permission == LocationPermission.denied){
            permission = await Geolocator.requestPermission();
            if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
              permission = await Geolocator.requestPermission();
            } else if(permission == LocationPermission.deniedForever){
              alertOpened = true;
              globalAlert(
                context,
                msg: 'Los servicios de ubicacion son necesarios para poder usar la aplicacion, por favor, activarlos desde los ajustes de la aplicación',
                title: 'Importante',
                closeOnPressed: () async {
                  await Geolocator.openAppSettings();
                },
                closeText: 'Abrir ajustes',
              );
            } else if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
              successLocation();
            }
          } else if(permission == LocationPermission.deniedForever){
            alertOpened = true;
            globalAlert(
              context,
              msg: 'Los servicios de ubicacion son necesarios para poder usar la aplicacion, por favor, activarlos desde los ajustes de la aplicación',
              title: 'Importante',
              closeOnPressed: () async {
                await Geolocator.openAppSettings();
              },
              closeText: 'Abrir ajustes',
            );
          } else if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
            successLocation();
          }
        } else if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
          successLocation();
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

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}