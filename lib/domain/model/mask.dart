import 'package:flutter_mask_inventory/data/mapper/mask_mapper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mask.freezed.dart';

part 'mask.g.dart';

@freezed
class Mask with _$Mask {
  const factory Mask({
    required String storeName,
    required String address,
    required MaskRemainStatus remainStatus
  }) = _Mask;

  factory Mask.fromJson(Map<String, Object?> json) => _$MaskFromJson(json);
}