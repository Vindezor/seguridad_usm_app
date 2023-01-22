import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_app/ui/admin_home/widgets/admin_button.dart';

import '../../routes/routes.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () => {
              Navigator.of(context).pushNamed(Routes.account)
            },
            child: const Icon(
              Icons.account_circle,
              color: Colors.blue,
              size: 50,
            ),
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              AdminButton(Icons.directions_bus, 'Registrar unidad', Routes.register_unidad),
              AdminButton(Icons.badge, 'Cambiar rol', Routes.register_marca),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              AdminButton(Icons.bus_alert, 'Registrar marca', Routes.register_marca),
              AdminButton(Icons.bus_alert, 'Registrar modelo', Routes.register_modelo),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              AdminButton(Icons.person_search, 'Asignar chofer', Routes.register_marca),
            ],
          )
        ],
      ),
    );
  }
}