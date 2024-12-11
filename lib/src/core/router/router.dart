import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sizzle_starter/src/feature/home/widget/home_screen.dart';

part 'router.g.dart';

/// Creates the router
GoRouter createRouter() => GoRouter(routes: $appRoutes);

/// Home route
@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}
