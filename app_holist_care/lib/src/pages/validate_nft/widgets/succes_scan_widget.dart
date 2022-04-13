import 'package:app_holist_care/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScanWidget extends StatelessWidget {
  const SuccessScanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/images/success.json', width: 150),
        const SizedBox(height: 10),
        Text(
          'Sucesso NFT liberado para festa.',
          style: AppTheme.textStyles.textoSuccessoNFT,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
