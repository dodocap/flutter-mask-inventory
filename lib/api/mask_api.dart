import 'package:flutter_mask_inventory/core/result.dart';
import 'package:flutter_mask_inventory/dto/mask_dto.dart';

abstract interface class MaskApi {
  Future<Result<List<MaskDto>>> getMaskInventory();
}