import 'package:flutter_mask_inventory/dto/mask_dto.dart';

abstract interface class MaskApi {
  Future<List<MaskDto>> getMaskInventory();
}