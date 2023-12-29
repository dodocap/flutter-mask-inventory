import 'package:flutter_mask_inventory/model/mask.dart';
import 'package:flutter_mask_inventory/repository/mask_repository.dart';
import 'package:flutter_mask_inventory/repository/mask_repository_impl.dart';

class MainViewModel {
  final MaskRepository _maskRepository = MaskRepositoryImpl();

  Future<List<Mask>> getMaskInventory() async {
    List<Mask> maskList = await _maskRepository.getMaskInventory();
    return maskList;
  }
}

