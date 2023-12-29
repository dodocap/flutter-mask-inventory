import 'package:flutter_mask_inventory/ui/main/main_screen.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => MainScreen(),
    ),
  ],
);
