import 'package:flutter_mask_inventory/mapper/mask_mapper.dart';

class Mask {
  String storeName;
  String address;
  MaskRemainStatus remainStatus;

  Mask({
    required this.storeName,
    required this.address,
    required this.remainStatus,
  });

  @override
  String toString() {
    return 'Mask{name: $storeName, address: $address, remainStatus: $remainStatus}';
  }
}