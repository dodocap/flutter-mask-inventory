import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mask_inventory/model/mask.dart';
import 'package:flutter_mask_inventory/repository/mask_repository.dart';
import 'package:flutter_mask_inventory/ui/main/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final MaskRepository _maskRepository;

  MainViewModel({required MaskRepository maskRepository}) : _maskRepository = maskRepository;

  MainState _state = const MainState();
  MainState get state => _state;

  Future<void> getMaskInventory() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final maskList = await _maskRepository.getMaskInventory();
    _state = _state.copyWith(isLoading: false, maskList: maskList);
    notifyListeners();
  }
}