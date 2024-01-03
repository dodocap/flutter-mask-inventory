import 'package:flutter_mask_inventory/api/mask_api.dart';
import 'package:flutter_mask_inventory/api/mask_api_impl.dart';
import 'package:flutter_mask_inventory/repository/mask_repository.dart';
import 'package:flutter_mask_inventory/repository/mask_repository_impl.dart';
import 'package:flutter_mask_inventory/ui/main/main_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<MaskApi>(MaskApiImpl());

  getIt.registerSingleton<MaskRepository>(MaskRepositoryImpl(maskApi: getIt<MaskApi>()));

  getIt.registerFactory<MainViewModel>(() => MainViewModel(maskRepository: getIt<MaskRepository>()));
}