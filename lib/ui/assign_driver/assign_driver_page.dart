import 'package:flutter/material.dart';
import 'package:login_app/ui/assign_driver/widgets/assig_driver_camps.dart';
import 'package:provider/provider.dart';

import 'assign_driver_controller.dart';

class AssignDriverPage extends StatelessWidget {
  const AssignDriverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AssignDriverController>(
          create: (_) {
            final controller =  AssignDriverController();
            controller.loadUsuarios(context);
            return controller;
          },
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: AssignDriverCamps(),
              )
            ),
          )
        ),
      ),
    );
  }
}