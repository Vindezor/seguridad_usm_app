import 'package:flutter/material.dart';
import 'package:login_app/ui/register_marca/register_marca_controller.dart';
import 'package:login_app/ui/register_marca/widgets/register_marca_camps.dart';
import 'package:provider/provider.dart';

class RegisterMarcaPage extends StatelessWidget {
  const RegisterMarcaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegisterMarcaController>(
          create: (_) {
            final controller =  RegisterMarcaController();
            //controller.loadGender(context);
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
              child: RegisterMarcaCamps(),
            )
          ),
        ),
      ),
    );
  }
}