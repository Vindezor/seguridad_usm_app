import 'package:flutter/material.dart';
import 'package:login_app/ui/register/register_controller.dart';
import 'package:login_app/ui/register/widgets/register_camps.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegisterController>(
          create: (_) {
            final controller =  RegisterController();
            controller.loadGender(context);
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
              child: RegisterCamps(),
            )
          ),
        ),
      ),
    );
  }
}