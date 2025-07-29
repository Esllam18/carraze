import 'package:carraze/core/widgets/custom_snackbar.dart';
import 'package:carraze/core/widgets/custom_text.dart';
import 'package:carraze/core/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final List<Map<String, String>> favoriteCars = [
    {
      'name': 'Toyota Camry',
      'manufacturer': 'Toyota',
      'model': 'Camry',
      'year': '2023',
      'imagePath': 'assets/car2.jpg',
    },
    {
      'name': 'BMW X5',
      'manufacturer': 'BMW',
      'model': 'X5',
      'year': '2022',
      'imagePath': 'assets/car3.jpg',
    },
  ];

  void _removeFavorite(String carName) {
    setState(() {
      favoriteCars.removeWhere((car) => car['name'] == carName);
    });
    CustomSnackBar.show(
      context,
      message: '$carName removed from favorites!',
      type: SnackBarType.info,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          txt: 'Favorites',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/car1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (favoriteCars.isEmpty)
                        Center(
                          child: CustomText(
                            txt: 'No favorites yet!',
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      if (favoriteCars.isNotEmpty)
                        ...favoriteCars
                            .map((car) => _buildFavoriteItem(context, car))
                            .toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteItem(BuildContext context, Map<String, String> car) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E).withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(car['imagePath']!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: CustomText(
          txt: car['name']!,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        subtitle: CustomText(
          txt: '${car['manufacturer']} ${car['model']} (${car['year']})',
          fontSize: 14,
          color: Colors.white70,
        ),
        trailing: SizedBox(
          width: 80,
          child: CustomButton(
            backgroundColor: const Color(0xFFF44336),
            content: CustomText(
              txt: 'Remove',
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () => _removeFavorite(car['name']!),
          ),
        ),
        onTap: () {
          context.push('/car-details');
          // Pass car details if needed, e.g., extra: car
        },
      ),
    );
  }
}
