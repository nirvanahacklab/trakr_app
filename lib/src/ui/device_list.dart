import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_reactive_ble_example/src/ble/ble_scanner.dart';
import 'package:flutter_reactive_ble_example/src/constants/constant_colors.dart';
import 'package:flutter_reactive_ble_example/src/ui/device_log_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../ble/ble_logger.dart';
import '../widgets.dart';
import 'device_detail/device_detail_screen.dart';

class DeviceListScreen extends StatelessWidget {
  const DeviceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Consumer3<BleScanner, BleScannerState?, BleLogger>(
        builder: (_, bleScanner, bleScannerState, bleLogger, __) => _DeviceList(
          scannerState: bleScannerState ??
              const BleScannerState(
                discoveredDevices: [],
                scanIsInProgress: false,
              ),
          startScan: bleScanner.startScan,
          stopScan: bleScanner.stopScan,
          toggleVerboseLogging: bleLogger.toggleVerboseLogging,
          verboseLogging: bleLogger.verboseLogging,
        ),
      );
}

class _DeviceList extends StatefulWidget {
  const _DeviceList({
    required this.scannerState,
    required this.startScan,
    required this.stopScan,
    required this.toggleVerboseLogging,
    required this.verboseLogging,
  });

  final BleScannerState scannerState;
  final void Function(List<Uuid>) startScan;
  final VoidCallback stopScan;
  final VoidCallback toggleVerboseLogging;
  final bool verboseLogging;

  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<_DeviceList> {

  @override
  void initState() {

  }

  @override



  void _startScanning() {
    widget.startScan([]);
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: background,
      drawer: Drawer(
        child: Scaffold(
          backgroundColor: background.withOpacity(1),
          body: Column(
            children: [
                Container(
                  height: height*0.23,
                  width: width,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: background.withOpacity(1),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black, //New
                          blurRadius: 10.0,
                          offset: Offset(0,0))
                    ],
                  ),
                  //child: SvgPicture.asset('assets/HacklabLogo1.svg',),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/AppLogo.png", scale:0.8,),
                      SizedBox(width: width*0.05,),
                      Text("TRAKR", style: TextStyle(color: highlight, fontSize: height*0.04, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
              SizedBox(
                height: height*0.03,
              ),
              ListTile(
                title: Text("Devices",style: TextStyle(color: Colors.white,fontSize: width*0.04),),

                leading: Icon(Icons.bluetooth_audio_outlined, size: width*0.08, color: Colors.white,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute<void>(builder: (context) => DeviceListScreen()));
                },
              ),
              ListTile(
                title: Text("Logs",style: TextStyle(fontSize: width*0.04,color: Colors.white,), ),

                leading: Icon(Icons.note_alt_outlined, size: width*0.08,color: Colors.white,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute<void>(builder: (context) => DeviceLogScreen()));
                },
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Devices', style: TextStyle(color: Colors.white, fontSize: height*0.03)),
        actions: <Widget>[
          GestureDetector(
            onTap: !widget.scannerState.scanIsInProgress
                ? _startScanning
                : widget.stopScan,
            child: Container(
              height: height,
              margin: EdgeInsets.only(right: width*0.03, bottom: height*0.015, top: height*0.01),
              padding: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.002),
              decoration: BoxDecoration(
                color: highlight,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Center(child: Text((!widget.scannerState.scanIsInProgress)?'Start Scan':'Stop Scan', style: TextStyle(color: Colors.white, fontSize: height*0.02, fontWeight: FontWeight.w500))),
            ),

          )
        ],

      ),
      body: Column(
        children: [

          const SizedBox(height: 8),
          Flexible(
            child: ListView(
              children: [

                ListTile(
                  title: Text(
                    !widget.scannerState.scanIsInProgress
                        ? 'Tap start to begin scanning'
                        : 'Tap a device to connect to it',
                    style: TextStyle(fontSize: width*0.042, color: Colors.white)
                  ),
                  trailing: (widget.scannerState.scanIsInProgress ||
                      widget.scannerState.discoveredDevices.isNotEmpty)
                      ? Text(
                    'count: ${widget.scannerState.discoveredDevices.length}',
                    style: TextStyle(fontSize: width*0.042, color: Colors.white),
                  )
                      : null,
                ),
                ...widget.scannerState.discoveredDevices
                    .map(
                      (device) =>
                      ListTile(

                        title: Text(device.name, style: TextStyle(color: Colors.white),),
                        subtitle: Text("${device.id}\nRSSI: ${device.rssi}",style: TextStyle(color: Colors.white)),
                        leading: const BluetoothIcon(),
                        onTap: () async {
                          widget.stopScan();
                          await Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      DeviceDetailScreen(device: device)));
                        },
                      ),
                )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
