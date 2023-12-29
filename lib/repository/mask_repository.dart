import 'package:flutter_mask_inventory/model/mask.dart';

abstract interface class MaskRepository {
  Future<List<Mask>> getMaskInventory();
}