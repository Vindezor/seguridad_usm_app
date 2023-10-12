
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/utils/logout.dart';

class BlockedUserPage extends StatelessWidget {
  const BlockedUserPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Seguridad USM",
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
          child: Center(
            child: Text(
            "Su cuenta no se encuentra activa, por favor dirijase a un administrador para poder activarla",
            style: GoogleFonts.lobster(
              textStyle: const TextStyle(
                color: Colors.blue,
                fontSize: 30
              ),
            ),
            textAlign: TextAlign.center,
          ),
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