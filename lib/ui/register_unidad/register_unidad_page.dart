import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_app/ui/register_unidad/register_unidad_controller.dart';
import 'package:login_app/ui/register_unidad/widgets/register_unidad_camps.dart';
import 'package:provider/provider.dart';

class RegisterUnidadPage extends StatelessWidget {
  const RegisterUnidadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegisterUnidadController>(
          create: (_) {
            final controller =  RegisterUnidadController();
            controller.loadMarca(context);
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
              child: RegisterUnidadCamps(),
            )
          ),
        ),
      ),
    );
  }
}