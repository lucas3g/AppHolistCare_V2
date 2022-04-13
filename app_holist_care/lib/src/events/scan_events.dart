abstract class ScanEvents {}

class VerifyNFTEvent extends ScanEvents {
  final String nft;

  VerifyNFTEvent({
    required this.nft,
  });
}
