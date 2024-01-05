import 'package:flutter_mask_inventory/data/api/mask_api.dart';
import 'package:flutter_mask_inventory/data/api/mask_api_impl.dart';
import 'package:flutter_mask_inventory/data/repository/mask_repository.dart';
import 'package:flutter_mask_inventory/domain/repository/mask_repository_impl.dart';
import 'package:flutter_mask_inventory/domain/use_case/get_mask_inventory_use_case.dart';
import 'package:flutter_mask_inventory/presentation/main/main_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<MaskApi>(MaskApiImpl());

  getIt.registerSingleton<MaskRepository>(MaskRepositoryImpl(maskApi: getIt<MaskApi>()));

  getIt.registerSingleton<GetMaskInventoryUseCase>(GetMaskInventoryUseCase(maskRepository: getIt<MaskRepository>()));

  getIt.registerFactory<MainViewModel>(() => MainViewModel(getMaskInventoryUseCase: getIt<GetMaskInventoryUseCase>()));
}