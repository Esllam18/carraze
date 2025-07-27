import 'package:carraze/core/router/route_names.dart';
import 'package:carraze/features/splach/splach_view.dart';
import 'package:carraze/features/splach/wlcome_view.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: RouteNames.splash, builder: (context, state) => SplashView()),
    GoRoute(
      path: RouteNames.welcome,
      builder: (context, state) => WelcomeView(),
    ),
  ],
);
