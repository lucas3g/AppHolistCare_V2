import 'package:app_holist_care/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AlreadyUsedWidget extends StatelessWidget {
  const AlreadyUsedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/images/warning.json', width: 150),
        const SizedBox(height: 10),
        Text(
          'Atençao, esse NFT já foi utilizado.',
          style: AppTheme.textStyles.textoSuccessoNFT,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
