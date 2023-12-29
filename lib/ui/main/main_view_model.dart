import 'package:flutter/material.dart';
import 'package:flutter_mask_inventory/model/mask.dart';

class MainViewModel extends StatelessWidget {
  final Mask _mask;
  final void Function(Mask mask) _onTap;

  const MainViewModel({
    super.key,
    required Mask mask,
    required void Function(Mask mask) onTap,
  }) : _mask = mask, _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_mask.storeName),
      subtitle: Text(_mask.address),
      trailing: Text(
        _mask.remainStatus.statusText,
        style: TextStyle(color: _mask.remainStatus.color),
      ),
      onTap: () => _onTap(_mask),
    );
  }
}
