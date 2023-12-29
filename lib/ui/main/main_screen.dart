import 'package:flutter/material.dart';
import 'package:flutter_mask_inventory/model/mask.dart';
import 'package:flutter_mask_inventory/ui/main/main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainViewModel _mainViewModel = MainViewModel();

  @override
  void initState() {
    _mainViewModel.getMaskInventory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('마스크 재고 관리'),
          actions: [
            IconButton(
              onPressed: () => _mainViewModel.getMaskInventory(),
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        body: StreamBuilder(
          initialData: false,
          stream: _mainViewModel.isLoading,
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return const Center(child: CircularProgressIndicator());
            }

            final List<Mask> list = _mainViewModel.maskList;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final Mask mask = list[index];
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
        ));
  }
}
