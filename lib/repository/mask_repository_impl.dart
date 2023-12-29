import 'package:flutter_mask_inventory/api/mask_api.dart';
import 'package:flutter_mask_inventory/api/mask_api_impl.dart';
import 'package:flutter_mask_inventory/dto/mask_dto.dart';
import 'package:flutter_mask_inventory/mapper/mask_mapper.dart';
import 'package:flutter_mask_inventory/model/mask.dart';
import 'package:flutter_mask_inventory/repository/mask_repository.dart';

class MaskRepositoryImpl implements MaskRepository {
  final MaskApi _maskApi = MaskApiImpl();

  @override
  Future<List<Mask>> getMaskInventory() async {
    List<MaskDto> maskDtoList = await _maskApi.getMaskInventory();
    return maskDtoList.map((dto) => dto.mapToModel()).toList();
  }
}