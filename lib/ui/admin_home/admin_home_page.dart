import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/ui/admin_home/widgets/admin_button.dart';
import 'package:login_app/utils/logout.dart';

import '../../routes/routes.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  "Seguridad USM",
                  style: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 40
                    ),
                  )
                ),
              ),
              ListTile(
                title: const Text("Perfil de usuario", style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.account);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Administrador",
            style: GoogleFonts.lobster(
              textStyle: const TextStyle(
                //color: Colors.white,
                fontSize: 30
              ),
            )
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
          // leading: GestureDetector(
          //   onTap: () => {
          //     Navigator.of(context).pushNamed(Routes.account)
          //   },
          //   child: const Icon(
          //     Icons.account_circle,
          //     color: Colors.blue,
          //     size: 50,
          //   ),
          // ),
          actions: [
            GestureDetector(
              onTap: () => {
                logout(context)
              },
              child: const Icon(
                Icons.logout,
                //color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 10,),
          ],
        ),
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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdminButton(Icons.directions_bus, 'Registrar unidad', Routes.registerUnidad),
                  AdminButton(Icons.badge, 'Cambiar rol', Routes.changeRol),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdminButton(Icons.bus_alert, 'Registrar marca', Routes.registerMarca),
                  AdminButton(Icons.bus_alert, 'Registrar modelo', Routes.registerModelo),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdminButton(Icons.person_search, 'Asignar chofer', Routes.assignDriver),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}