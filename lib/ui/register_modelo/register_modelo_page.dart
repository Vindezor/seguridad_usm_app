import 'package:flutter/material.dart';
import 'package:login_app/ui/register_marca/register_marca_controller.dart';
import 'package:login_app/ui/register_marca/widgets/register_marca_camps.dart';
import 'package:login_app/ui/register_modelo/register_modelo_controller.dart';
import 'package:login_app/ui/register_modelo/widgets/register_modelo_camps.dart';
import 'package:provider/provider.dart';

class RegisterModeloPage extends StatelessWidget {
  const RegisterModeloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegisterModeloController>(
          create: (_) {
            final controller =  RegisterModeloController();
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
              child: RegisterModeloCamps(),
            )
          ),
        ),
      ),
    );
  }
}