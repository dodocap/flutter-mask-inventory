import 'package:flutter_mask_inventory/repository/mask_repository_impl.dart';
import 'package:flutter_mask_inventory/ui/main/main_screen.dart';
import 'package:flutter_mask_inventory/ui/main/main_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => MainViewModel(maskRepository: MaskRepositoryImpl()),
        child: const MainScreen(),
      ),
    ),
  ],
);
