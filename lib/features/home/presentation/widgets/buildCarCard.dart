import 'package:carraze/core/router/route_names.dart';
import 'package:carraze/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget buildCarCard({required String car, context}) {
  return GestureDetector(
    onTap: () {
      GoRouter.of(context).push(RouteNames.carDetail);
    },
    child: Card(
      // ignore: deprecated_member_use
      color: const Color(0xFF1C2526).withOpacity(0.8),
      child: Center(
        child: CustomText(
          txt: car,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
