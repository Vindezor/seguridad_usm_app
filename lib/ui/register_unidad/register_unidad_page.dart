import 'package:flutter/material.dart';
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
                child: RegisterUnidadCamps(),
              )
            ),
          )
        ),
      ),
    );
  }
}