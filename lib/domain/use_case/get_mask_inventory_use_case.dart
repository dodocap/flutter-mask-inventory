import 'package:flutter_mask_inventory/core/result.dart';
import 'package:flutter_mask_inventory/data/repository/mask_repository.dart';
import 'package:flutter_mask_inventory/domain/model/mask.dart';

class GetMaskInventoryUseCase {
  final MaskRepository _maskRepository;

  GetMaskInventoryUseCase({required MaskRepository maskRepository}) : _maskRepository = maskRepository;

  Future<Result<List<Mask>>> execute() async {
    return _maskRepository.getMaskInventory();
  }
}
