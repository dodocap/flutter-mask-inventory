import 'dart:convert';

import 'package:flutter_mask_inventory/api/mask_api.dart';
import 'package:flutter_mask_inventory/dto/mask_dto.dart';
import 'package:http/http.dart' as http;

class MaskApiImpl implements MaskApi {
  @override
  Future<List<MaskDto>> getMaskInventory() async {
    final http.Response response = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json'));

    final resultMap = jsonDecode(response.body);
    final List<dynamic> listStores = resultMap['stores'];   // 왜 얘를 다이렉트로 쓰면 오류가..?
    return listStores.map((e) => MaskDto.fromJson(e)).toList();
  }
}