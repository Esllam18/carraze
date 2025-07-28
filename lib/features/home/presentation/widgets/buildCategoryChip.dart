import 'package:carraze/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget buildCategoryChip(String category, Function(String) onCategoryTap) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: GestureDetector(
      onTap: () => onCategoryTap(category),
      child: Chip(
        label: CustomText(txt: category, color: Colors.white),
        backgroundColor: const Color(0xFF1C2526).withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}
