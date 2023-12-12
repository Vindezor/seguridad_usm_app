import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_app/widgets/global_alert.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          overlayColor: const Color.fromRGBO(0, 0, 0, 80),
          borderColor: Colors.blue,
          borderWidth: 10
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      log('${ scanData.code!.split("/")[4]}');
      globalAlert(context, msg: "mmlo", title: "richard es pato", closeOnPressed: (){
        controller.resumeCamera();
        Navigator.of(context).pop();

      });
      controller.pauseCamera();
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }
}
