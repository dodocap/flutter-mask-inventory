import 'package:flutter_mask_inventory/core/result.dart';
import 'package:flutter_mask_inventory/domain/model/mask.dart';

abstract interface class MaskRepository {
  Future<Result<List<Mask>>> getMaskInventory();
}