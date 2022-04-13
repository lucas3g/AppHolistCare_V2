import 'package:app_holist_care/src/pages/validate_nft/validate_nft_page.dart';
import 'package:app_holist_care/src/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanNFT extends StatefulWidget {
  const ScanNFT({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanNFTState();
}

class _ScanNFTState extends State<ScanNFT> {
  Barcode? result;
  QRViewController? controller;
  late String qrCode = '';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final LoginRepository loginRepository = LoginRepository();

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.code!.isNotEmpty && qrCode.isEmpty) {
        qrCode = scanData.code!;
        await sendCodeToServer();
      }
    });
  }

  Future<void> sendCodeToServer() async {
    if (qrCode.isNotEmpty) {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ValidateNFTPage(
            qrCode: qrCode,
          ),
        ),
      );
      qrCode = '';
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permissão negada')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutHeight: 400,
              cutOutWidth: 350,
            ),
            onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      if (await loginRepository.removeLogin()) {
                        await Navigator.pushReplacementNamed(context, '/login');
                      }
                    },
                    icon: const Icon(Icons.exit_to_app),
                    label: const Text('Sair do app'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
