import 'package:flutter_mask_inventory/api/mask_api.dart';
import 'package:flutter_mask_inventory/core/result.dart';
import 'package:flutter_mask_inventory/dto/mask_dto.dart';
import 'package:flutter_mask_inventory/mapper/mask_mapper.dart';
import 'package:flutter_mask_inventory/model/mask.dart';
import 'package:flutter_mask_inventory/repository/mask_repository.dart';

class MaskRepositoryImpl implements MaskRepository {
  final MaskApi _maskApi;

  const MaskRepositoryImpl({
    required MaskApi maskApi,
  }) : _maskApi = maskApi;

  @override
  Future<Result<List<Mask>>> getMaskInventory() async {
    final Result<List<MaskDto>> result = await _maskApi.getMaskInventory();

    return result.when(
      success: (data) => Result.success(data.map((e) => e.mapToModel()).toList()),
      error: (e) => Result.error(e),
    );
  }
}
