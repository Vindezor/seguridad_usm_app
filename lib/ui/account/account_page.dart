import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:login_app/ui/account/account_controller.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 150;
    const double avatarSize = iconSize / 2;
    
    return ChangeNotifierProvider(
      create: (_) {
        final controller = AccountController();
        controller.loadData();
        return controller;
      },
      builder: (context, child) {
        final controller = Provider.of<AccountController>(context);
        if (controller.dataLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Perfil de usuario'),
              elevation: 0,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.blue,
                            radius: avatarSize,
                            child: Icon(
                              Icons.account_circle,
                              size: iconSize,
                            ),
                          ),
                          Text(
                            controller.fullName!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nombre de usuario:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            TextFormField(
                              controller: controller.usernameController,
                              //initialValue: controller.username,
                              readOnly: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Correo Electrónico:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            TextFormField(
                              controller: controller.emailController,
                              //initialValue: controller.email,
                              readOnly: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Numero de teléfono:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: controller.phoneController,
                              inputFormatters: [
                                MaskedInputFormatter('(###) ###-####')
                              ],
                              //initialValue: controller.phone,
                              readOnly: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Actualizar datos'),
                      ),
                    ],
                  )
                ],
              ),
            )
          );
        }
        return child!;
      },
      child: Container(
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
          child: CircularProgressIndicator()
        ),
      ),
    );
  }
}