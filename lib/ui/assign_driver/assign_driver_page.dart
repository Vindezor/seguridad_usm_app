import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
        child: const Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: AssignDriverCamps(),
            )
          ),
        ),
      ),
    );
  }
}