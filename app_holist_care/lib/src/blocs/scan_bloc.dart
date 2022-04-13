import 'package:app_holist_care/src/events/scan_events.dart';
import 'package:app_holist_care/src/repositories/scan_repository.dart';
import 'package:app_holist_care/src/states/scan_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanBloc extends Bloc<ScanEvents, ScanStates> {
  final ScanRepository scanRepository;

  ScanBloc({required this.scanRepository}) : super(ScanInitialState()) {
    on<VerifyNFTEvent>(verifyNFT);
  }

  Future<void> verifyNFT(VerifyNFTEvent event, emit) async {
    emit(ScanLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    final result = await scanRepository.verifyNFT(nft: event.nft);

    switch (result) {
      case 'ACCEPT':
        emit(ScanSuccesState());
        break;
      case 'ALREADYUSED':
        emit(ScanNFTAlreadyUsed());
        break;
      default:
        emit(ScanErrorState());
    }
  }
}
