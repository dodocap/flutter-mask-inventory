import 'dart:convert';

import 'package:flutter_mask_inventory/core/result.dart';
import 'package:flutter_mask_inventory/data/api/mask_api.dart';
import 'package:flutter_mask_inventory/data/dto/mask_dto.dart';
import 'package:http/http.dart' as http;

class MaskApiImpl implements MaskApi {
  @override
  Future<Result<List<MaskDto>>> getMaskInventory() async {
    try {
      final http.Response response = await http.get(Uri.parse(
          'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json'));

      final resultMap = jsonDecode(response.body);
      final List<dynamic> listStores = resultMap['stores'];
      return Result.success(listStores.map((e) => MaskDto.fromJson(e)).toList());
    } catch (e) {
      return const Result.error('네트워크 오류가 발생했습니다.');
    }
  }
}