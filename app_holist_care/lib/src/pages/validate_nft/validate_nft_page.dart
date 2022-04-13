import 'dart:async';

import 'package:app_holist_care/src/blocs/scan_bloc.dart';
import 'package:app_holist_care/src/events/scan_events.dart';
import 'package:app_holist_care/src/pages/scan_qrcode/scan_qrcode_page.dart';
import 'package:app_holist_care/src/pages/validate_nft/widgets/already_used_widget.dart';
import 'package:app_holist_care/src/pages/validate_nft/widgets/error_scan_widget.dart';
import 'package:app_holist_care/src/pages/validate_nft/widgets/loading_scan_widget.dart';
import 'package:app_holist_care/src/pages/validate_nft/widgets/succes_scan_widget.dart';
import 'package:app_holist_care/src/states/scan_states.dart';
import 'package:app_holist_care/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ValidateNFTPage extends StatefulWidget {
  final String qrCode;
  const ValidateNFTPage({Key? key, required this.qrCode}) : super(key: key);

  @override
  State<ValidateNFTPage> createState() => _ValidateNFTPageState();
}

class _ValidateNFTPageState extends State<ValidateNFTPage> {
  late ScanBloc bloc;
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I.get<ScanBloc>();

    bloc.add(VerifyNFTEvent(nft: widget.qrCode));

    sub = bloc.stream.listen((state) async {
      if (state is ScanSuccesState ||
          state is ScanErrorState ||
          state is ScanNFTAlreadyUsed) {
        await Future.delayed(const Duration(seconds: 3));
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const ScanNFT(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ScanBloc, ScanStates>(
                bloc: bloc,
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: state is ScanLoadingState ||
                                  state is ScanSuccesState
                              ? AppTheme.colors.primary
                              : state is ScanErrorState
                                  ? Colors.red
                                  : Colors.grey,
                          height: 5,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          color: state is ScanSuccesState
                              ? AppTheme.colors.primary
                              : state is ScanErrorState
                                  ? Colors.red
                                  : Colors.grey,
                          height: 5,
                        ),
                      ),
                    ],
                  );
                }),
            Center(
              child: BlocBuilder<ScanBloc, ScanStates>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is ScanLoadingState) {
                      return const LoadingScanWidget();
                    } else if (state is ScanSuccesState) {
                      return const SuccessScanWidget();
                    } else if (state is ScanErrorState) {
                      return const ErrorScanWidget();
                    } else if (state is ScanNFTAlreadyUsed) {
                      return const AlreadyUsedWidget();
                    } else {
                      return Container();
                    }
                  }),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
