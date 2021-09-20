import 'dart:io';
import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScreen extends StatefulWidget {
  final Widget? headerWidget;
  final Future? Function(String)? onScan;
  final double? scanBoxRatio;
  final Widget? helpWidget;
  const QrCodeScreen(
      {Key? key,
      this.onScan,
      this.headerWidget,
      this.helpWidget,
      this.scanBoxRatio = 0.85})
      : super(key: key);

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mFillColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: _buildQrView(context),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final qrScanSize = constraints.maxWidth *
              double.parse(widget.scanBoxRatio.toString());
          final mediaQuery = MediaQuery.of(context);
          if (constraints.maxHeight < qrScanSize * 1.5) {
            // print("Kiem tra kich thuoc");
          }
          return Stack(
            children: [
              QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: primaryBlue,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: scanArea),
              ),
              // if (widget.headerWidget != null) widget.headerWidget,
              // if (result != null)
              //   Text(
              //       'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
              // else
              //   Text('Scan a code'),
              Positioned(
                top: 50,
                left: 0,
                width: constraints.maxWidth,
                child: Align(
                  alignment: Alignment.center,
                  child: DefaultTextStyle(
                    style: TextStyle(color: Colors.white),
                    child: widget.helpWidget ??
                        Text("Di chuyển camera đến mã QR để quét"),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.all(15),
                child: InkWell(
                    onTap: () async {
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                    child: FutureBuilder(
                      future: controller?.getFlashStatus(),
                      builder: (context, snapshot) {
                        return Icon(
                          Icons.flashlight_on_outlined,
                          color: Colors.white60,
                        );
                      },
                    )),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print(result.code);
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
