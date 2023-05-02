import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble_example/src/ui/device_detail/device_log_tab.dart';

class DeviceLogScreen extends StatefulWidget {
  const DeviceLogScreen({Key? key}) : super(key: key);

  @override
  State<DeviceLogScreen> createState() => _DeviceLogScreenState();
}

class _DeviceLogScreenState extends State<DeviceLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Logs"),),
      body: DeviceLogTab(),
    );
  }
}
