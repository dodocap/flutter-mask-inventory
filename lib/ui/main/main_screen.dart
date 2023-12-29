import 'package:flutter/material.dart';
import 'package:flutter_mask_inventory/model/mask.dart';
import 'package:flutter_mask_inventory/repository/mask_repository.dart';
import 'package:flutter_mask_inventory/repository/mask_repository_impl.dart';

class MainScreen extends StatelessWidget {
  final MaskRepository _maskRepository = MaskRepositoryImpl();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('마스크 재고 관리')),
      body: FutureBuilder(
        future: _maskRepository.getMaskInventory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<Mask> maskList = snapshot.data!;
          return ListView.builder(
            itemCount: maskList.length,
            itemBuilder: (context, index) {
              final Mask mask = maskList[index];
              return ListTile(
                title: Text(mask.storeName),
                subtitle: Text(mask.address),
                trailing: Text(
                  mask.remainStatus.statusText,
                  style: TextStyle(color: mask.remainStatus.color),
                ),
                onTap: () => print(mask),
              );
            },
          );
        },
      ),
    );
  }
}
