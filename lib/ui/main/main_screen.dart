import 'package:flutter/material.dart';
import 'package:flutter_mask_inventory/model/mask.dart';
import 'package:flutter_mask_inventory/ui/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<MainViewModel>().getMaskInventory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('마스크 재고 관리'),
        actions: [
          IconButton(
            onPressed: () => viewModel.getMaskInventory(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: state.maskList.length,
              itemBuilder: (context, index) {
                final Mask mask = state.maskList[index];
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
            ),
    );
  }
}
