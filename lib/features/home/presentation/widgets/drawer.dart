import 'package:carraze/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(String) onMenuItemTap;

  const CustomDrawer({super.key, required this.onMenuItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF1C2526)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[800],
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 10),
                CustomText(
                  txt: 'Eslam Maher',
                  fontSize: 20,
                  color: Colors.white,
                ),
                CustomText(
                  txt: 'esllam.maher@gmail.com',
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Color(0xFF2E4A62)),
            title: CustomText(txt: 'Home', color: Colors.white),
            onTap: () => onMenuItemTap('/home'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Color(0xFF2E4A62)),
            title: CustomText(txt: 'Favorites', color: Colors.white),
            onTap: () => onMenuItemTap('/favorites'),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Color(0xFF2E4A62)),
            title: CustomText(txt: 'Profile', color: Colors.white),
            onTap: () => onMenuItemTap('/profile'),
          ),
          ListTile(
            leading: const Icon(Icons.search, color: Color(0xFF2E4A62)),
            title: CustomText(txt: 'Search', color: Colors.white),
            onTap: () => onMenuItemTap('/search'),
          ),
        ],
      ),
    );
  }
}
