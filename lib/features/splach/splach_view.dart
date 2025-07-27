import 'package:carraze/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Navigate to WelcomeView after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(
        context,
      ).replace(RouteNames.welcome); // Adjust the route as needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splas.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
