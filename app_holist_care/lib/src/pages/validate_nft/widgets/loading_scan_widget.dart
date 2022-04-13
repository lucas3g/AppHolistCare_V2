import 'package:app_holist_care/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoadingScanWidget extends StatelessWidget {
  const LoadingScanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 10),
        Text(
          'Validando NFT. Aguarde...',
          style: AppTheme.textStyles.textoSuccessoNFT,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
