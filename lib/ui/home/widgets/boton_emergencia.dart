import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login_app/ui/home/home_controller.dart';
import 'package:login_app/widgets/global_alert.dart';
import 'package:provider/provider.dart';

class BotonEmergencia extends StatefulWidget {
  const BotonEmergencia({Key? key}) : super(key: key);

  @override
  State<BotonEmergencia> createState() => _BotonEmergenciaState();
}

class _BotonEmergenciaState extends State<BotonEmergencia>
    with WidgetsBindingObserver {
  bool alertOpened = false;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLocation();
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // TODO: implement didChangeAppLifecycleState
    if (state == AppLifecycleState.resumed) {
      var enabled = await Geolocator.isLocationServiceEnabled();
      if (enabled && alertOpened) {
        Navigator.pop(context);
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  void checkLocation() async {
    var enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      alertOpened = true;

      globalAlert(
        context,
        msg:
            'Debe activar el servicio de localizacion para poder pedir emergencia',
        title: 'Importante',
        closeText: 'Abrir Ajustes',
        closeOnPressed: () => Geolocator.openLocationSettings(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 200),
          shape: const CircleBorder(),
          // backgroundColor: Colors.red
        ),
        onPressed: () async {
          var enabled = await Geolocator.isLocationServiceEnabled();

          if (enabled) {
            controller.emergencia(context);
          } else {
            alertOpened = true;
            globalAlert(
              context,
              msg:
                  'Debe activar el servicio de localizacion para poder pedir emergencia',
              title: 'Importante',
              closeText: 'Abrir Ajustes',
              closeOnPressed: () => Geolocator.openLocationSettings(),
            );
          }
        },
        child: const Text(
          'EMERGENCIA',
          style: TextStyle(fontSize: 20),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
