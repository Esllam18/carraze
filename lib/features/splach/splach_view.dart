import 'package:carraze/core/router/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(
        // ignore: use_build_context_synchronously
        context,
      ).replace(
        FirebaseAuth.instance.currentUser == null
            ? RouteNames.welcome
            : RouteNames.home,
      ); // Adjust the route as needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "assets/splas.jpeg",
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .9,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
