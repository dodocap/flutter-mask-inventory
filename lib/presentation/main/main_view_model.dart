import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mask_inventory/core/result.dart';
import 'package:flutter_mask_inventory/core/ui_event.dart';
import 'package:flutter_mask_inventory/domain/model/mask.dart';
import 'package:flutter_mask_inventory/domain/use_case/get_mask_inventory_use_case.dart';
import 'package:flutter_mask_inventory/presentation/main/main_state.dart';

class MainViewModel extends ChangeNotifier {
  final GetMaskInventoryUseCase _getMaskInventoryUseCase;

  MainViewModel({required GetMaskInventoryUseCase getMaskInventoryUseCase}) : _getMaskInventoryUseCase = getMaskInventoryUseCase;

  MainState _state = const MainState();
  MainState get state => _state;

  final StreamController<UiEvent> _eventController = StreamController();
  Stream<UiEvent> get eventStream => _eventController.stream;

  Future<void> getMaskInventory() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Mask>> maskResult = await _getMaskInventoryUseCase.execute();

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
