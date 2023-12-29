import 'dart:async';

import 'package:flutter_mask_inventory/model/mask.dart';
import 'package:flutter_mask_inventory/repository/mask_repository.dart';
import 'package:flutter_mask_inventory/repository/mask_repository_impl.dart';

class MainViewModel {
  final MaskRepository _maskRepository = MaskRepositoryImpl();

  List<Mask> _maskList = [];
  List<Mask> get maskList => List.unmodifiable(_maskList);

  final StreamController<bool> _isLoading = StreamController();
  Stream<bool> get isLoading => _isLoading.stream;

  Future<void> getMaskInventory() async {
    _isLoading.add(true);
    _maskList = await _maskRepository.getMaskInventory();
    _isLoading.add(false);
  }
}