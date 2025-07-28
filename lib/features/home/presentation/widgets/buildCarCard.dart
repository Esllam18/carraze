import 'package:carraze/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget buildCarCard({required String car}) {
  return GestureDetector(
    onTap: () {},
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
