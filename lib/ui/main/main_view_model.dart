import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mask_inventory/core/result.dart';
import 'package:flutter_mask_inventory/core/ui_event.dart';
import 'package:flutter_mask_inventory/model/mask.dart';
import 'package:flutter_mask_inventory/repository/mask_repository.dart';
import 'package:flutter_mask_inventory/ui/main/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final MaskRepository _maskRepository;

  MainViewModel({required MaskRepository maskRepository}) : _maskRepository = maskRepository;

  MainState _state = const MainState();
  MainState get state => _state;

  final StreamController<UiEvent> _eventController = StreamController();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> getMaskInventory() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Mask>> maskResult = await _maskRepository.getMaskInventory();

    maskResult.when(
      success: (data) {
        _state = _state.copyWith(isLoading: false, maskList: data);
        notifyListeners();
      },
      error: (e) {
        _state = _state.copyWith(isLoading: false, maskList: List.empty());
        notifyListeners();
        _eventController.add(UiEvent.showSnackBar(e));
      },
    );
  }
}
