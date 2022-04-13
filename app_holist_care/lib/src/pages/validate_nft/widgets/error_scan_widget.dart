import 'package:app_holist_care/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorScanWidget extends StatelessWidget {
  const ErrorScanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/images/error.json', width: 150),
        const SizedBox(height: 10),
        Text(
          'Opss... NFT não liberado, scanear novamente',
          style: AppTheme.textStyles.textoSuccessoNFT,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
