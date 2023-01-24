import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/routes/routes.dart';
import 'package:login_app/ui/home/home_controller.dart';
import 'package:login_app/ui/home/widgets/boton_emergencia.dart';
import 'package:login_app/utils/logout.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(),
        ),
      ],
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
                Navigator.of(context).pop()
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
          child: const Center(
            child: BotonEmergencia()
          ),
        )
      ),
    );
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider<HomeController>(
    //       create: (_) {
    //         final controller = HomeController();
    //         controller.loadList();
    //         return controller;
    //       },
    //     ),
    //   ],
    //   child: WillPopScope(
    //     onWillPop: () async {
    //       logout(context);
    //       return false;
    //     },
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: const Text("Home"),
    //         actions: [
    //           IconButton(
    //             onPressed: () => logout(context),
    //             icon: const Icon(Icons.logout)
    //           )
    //         ],
    //       ),
    //       body: const ListViewPage(),
    //       floatingActionButton: const FloatingAdd()
    //     ),
    //   ),
    // );
  }
}