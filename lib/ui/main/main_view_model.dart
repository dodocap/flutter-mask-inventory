import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mask_inventory/model/mask.dart';
import 'package:flutter_mask_inventory/repository/mask_repository.dart';

class MainViewModel extends ChangeNotifier {
  final MaskRepository _maskRepository;

  MainViewModel({required MaskRepository maskRepository}) : _maskRepository = maskRepository;

  List<Mask> _maskList = [];
  List<Mask> get maskList => List.unmodifiable(_maskList);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getMaskInventory() async {
    _isLoading = true;
    notifyListeners();

    _maskList = await _maskRepository.getMaskInventory();
    _isLoading = false;
    notifyListeners();
  }
}