import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_reactive_ble_example/src/ble/ble_device_connector.dart';
import 'package:flutter_reactive_ble_example/src/constants/constant_colors.dart';
import 'package:flutter_reactive_ble_example/src/ui/device_detail/device_log_tab.dart';
import 'package:provider/provider.dart';

import 'device_interaction_tab.dart';

class DeviceDetailScreen extends StatelessWidget {
  final DiscoveredDevice device;

  const DeviceDetailScreen({required this.device, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<BleDeviceConnector>(
        builder: (_, deviceConnector, __) => _DeviceDetail(
          device: device,
          disconnect: deviceConnector.disconnect,
        ),
      );
}

class _DeviceDetail extends StatelessWidget {
  const _DeviceDetail({
    required this.device,
    required this.disconnect,
    Key? key,
  }) : super(key: key);

  final DiscoveredDevice device;
  final void Function(String deviceId) disconnect;
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          disconnect(device.id);
          return true;
        },
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: background,
            appBar: AppBar(
              title: Text(device.name),
            ),
            body: DeviceInteractionTab(device: device),
          ),
        ),
      );
}
