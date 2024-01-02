import 'package:flutter/material.dart';
import 'package:flutter_mask_inventory/dto/mask_dto.dart';
import 'package:flutter_mask_inventory/model/mask.dart';

enum MaskRemainStatus {
  plenty('plenty', '100개 이상', Colors.blue),
  some('some', '30~100개', Colors.green),
  few('few', '2~30개', Colors.amber),
  empty('empty', '1개 이하', Colors.red),
  breaks('break', '매진', Colors.grey),
  other('other', '재고파악불가', Colors.black);

  const MaskRemainStatus(this.name, this.statusText, this.color);

  final String name;
  final String statusText;
  final Color color;

  factory MaskRemainStatus.getByString(String status) {
    return MaskRemainStatus.values.firstWhere((e) => e.name == status);
  }
}

extension MaskMapper on MaskDto {
  Mask mapToModel() {
    return Mask(
      storeName: name ?? '이름없음',
      address: addr ?? '주소없음',
      remainStatus: MaskRemainStatus.getByString(remainStat ?? 'other'),
    );
  }
}
