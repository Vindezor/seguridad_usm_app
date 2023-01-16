import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login_app/routes/routes.dart';
import 'package:login_app/ui/home/home_controller.dart';
import 'package:login_app/utils/logout.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () => {
              Navigator.of(context).pushNamed(Routes.account)
            },
            child: const Icon(
              Icons.account_circle,
              color: Colors.blue,
              size: 50,
            ),
          ),
          const SizedBox(width: 10,),
        ],),
      body: Center(
        child: ElevatedButton(
          
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 200),
            shape: const CircleBorder(),
            primary: Colors.red
          ),
          onPressed: () {},
          child: const Text('EMERGENCIA', style: TextStyle(
            fontSize: 20
          ),)
        ),
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