import 'package:carraze/core/widgets/custom_button.dart';
import 'package:carraze/core/widgets/custom_snackbar.dart';
import 'package:carraze/core/widgets/custom_text.dart';
import 'package:carraze/features/profil/presentation/pages/widgets/buildProfileOption.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: CustomText(
            txt: 'Profile',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/car1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[800],
                child: const Icon(Icons.person, color: Colors.white, size: 70),
              ),
              const SizedBox(height: 15),
              CustomText(
                txt: 'Eslam Maher',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              CustomText(
                txt: 'esllam.maherr@gmail.com',
                fontSize: 18,
                color: Colors.white70,
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // i need to add buildProfileOption   display information
                    buildProfileOption(
                      context,
                      icon: Icons.info_outline,
                      title: 'Info',
                      onTap: () {},
                    ),

                    const Divider(color: Colors.white24, height: 1),
                    buildProfileOption(
                      context,
                      icon: Icons.settings,
                      title: 'Account Settings',
                      onTap: () {},
                    ),
                    const Divider(color: Colors.white24, height: 1),
                    buildProfileOption(
                      context,
                      icon: Icons.notifications,
                      title: 'Notifications',
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          message: 'Notifications toggled',
                          type: SnackBarType.success,
                        );
                      },
                    ),
                    const Divider(color: Colors.white24, height: 1),
                    buildProfileOption(
                      context,
                      icon: Icons.payment,
                      title: 'Payment Methods',
                      onTap: () => context.push('/payment-methods'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                backgroundColor: const Color(0xFFF44336),
                content: CustomText(
                  txt: 'Logout',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () {
                  CustomSnackBar.show(
                    context,
                    message: 'Logged out successfully',
                    type: SnackBarType.info,
                  );
                  context.pushReplacement('/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
