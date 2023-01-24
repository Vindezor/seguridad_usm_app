import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_app/ui/home/home_controller.dart';
import 'package:provider/provider.dart';

class BotonEmergencia extends StatelessWidget {
  const BotonEmergencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 200),
        shape: const CircleBorder(),
        backgroundColor: Colors.red
      ),
      onPressed: () => controller.emergencia(context),
      child: const Text('EMERGENCIA', style: TextStyle(
        fontSize: 20
      ),)
    );
  }
}