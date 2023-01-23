import 'package:flutter/material.dart';
import 'package:login_app/ui/change_rol/widgets/change_rol_camps.dart';
import 'package:provider/provider.dart';

import 'change_rol_controller.dart';

class ChangeRolPage extends StatelessWidget {
  const ChangeRolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeRolController>(
          create: (_) {
            final controller =  ChangeRolController();
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
              child: ChangeRolCamps(),
            )
          ),
        ),
      ),
    );
  }
}