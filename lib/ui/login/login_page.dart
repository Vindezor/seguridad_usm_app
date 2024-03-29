import 'package:flutter/material.dart';
import 'package:login_app/ui/login/login_controller.dart';
import 'package:login_app/ui/login/widgets/login_camps.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
          create: (_) => LoginController(),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async => false,
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
              child: const  Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: LoginCamps(),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}