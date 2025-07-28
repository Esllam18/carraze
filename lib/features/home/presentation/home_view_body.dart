import 'package:carraze/core/widgets/custom_text.dart';
import 'package:carraze/features/home/presentation/widgets/drawer.dart';
import 'package:carraze/features/home/presentation/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({super.key});

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView> {
  final TextEditingController searchController = TextEditingController();
  final List<String> categoriesWithCountry = [
    'Aston Martin (UK)',
    'Audi (Germany)',
    'Bentley (UK)',
    'BMW (Germany)',
    'Chery (China)',
    'Chevrolet (USA)',
    'Citroen (France)',
    'Ford (USA)',
    'Genesis (South Korea)',
    'General Motors (USA)',
    'Honda (Japan)',
    'Hyundai (South Korea)',
    'Jaguar (UK)',
    'Jeep (USA)',
    'Land Rover (UK)',
    'Lotus (UK)',
    'Lucid (USA)',
    'Maserati (Italy)',
    'Maybach (Germany)',
    'McLaren (UK)',
    'Mercedes-Benz (Germany)',
    'Nissan (Japan)',
    'Peugeot (France)',
    'Renault (France)',
    'Rolls-Royce (UK)',
    'Stellantis (Multinational)',
    'Suzuki (Japan)',
    'Toyota (Japan)',
    'Venturi (France)',
    'Volkswagen (Germany)',
  ];
  // Placeholder categories
  final List<String> carItems = [
    'Car 1',
    'Car 2',
    'Car 3',
    'Car 4',
  ]; // Placeholder car data

  void clearSearch() {
    searchController.clear();
    setState(() {});
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,

        elevation: 0,
        title: CustomText(
          txt: 'Cars',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),

        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomDrawer(
                  onMenuItemTap: (route) {
                    Navigator.pop(context); // Close the drawer
                    Navigator.pushNamed(context, route);
                  },
                ),
              ),
            );
          },
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(
        onMenuItemTap: (route) {
          Navigator.pop(context); // Close the drawer
          Navigator.pushNamed(context, route);
        },
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

          HomeBody(
            searchController: searchController,
            categories: categoriesWithCountry,
            carItems: carItems,
            clearSearch: clearSearch,
            onCategoryTap: (category) {
              // context.push('/category/$category'); // Navigate to category page
            },
            onCarTap: (car) {
              // context.push('/car/$car'); // Navigate to car details page
            },
          ),
        ],
      ),
    );
  }
}
