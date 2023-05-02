import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_reactive_ble_example/src/constants/constant_colors.dart';

class BleStatusScreen extends StatelessWidget {
  const BleStatusScreen({required this.status, Key? key}) : super(key: key);

  final BleStatus status;

  String determineText(BleStatus status) {
    switch (status) {
      case BleStatus.unsupported:
        return "This device does not support Bluetooth";
      case BleStatus.unauthorized:
        return "Authorize the FlutterReactiveBle example app to use Bluetooth and location";
      case BleStatus.poweredOff:
        return "Bluetooth is powered off on your device turn it on";
      case BleStatus.locationServicesDisabled:
        return "Enable location services";
      case BleStatus.ready:
        return "Bluetooth is up and running";
      default:
        return "Waiting to fetch Bluetooth status $status";
    }
  }

  @override
  Widget build(BuildContext context) =>  Scaffold(
    backgroundColor: Color(0xff222222),
    body: Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.height*0.25),
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.06),

        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset("assets/warning.png", scale: 4,),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.02,
        ),
        Text(determineText(status), style: TextStyle(color: highlight, fontSize: MediaQuery.of(context).size.height*0.027, ), textAlign: TextAlign.center,)
          ],
        ),
      ),
    ),
  );
}
