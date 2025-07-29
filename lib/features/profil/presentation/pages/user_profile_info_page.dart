import 'package:carraze/core/router/route_names.dart';
import 'package:carraze/core/widgets/custom_snackbar.dart';
import 'package:carraze/core/widgets/custom_text.dart';
import 'package:carraze/core/widgets/custom_button.dart';
import 'package:carraze/features/profil/presentation/pages/widgets/buildInfoRow.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserProfileInfoPage extends StatelessWidget {
  // Hardcoded sample signup data (to be replaced with actual user input later)
  final String name = 'Eslam Maher';
  final String email = 'esllam.maherr@gmail.com';
  final String phone = '01155374945';

  const UserProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          txt: 'Profile Info',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/car1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[800],
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomText(
                  txt: 'Personal Information',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              buildInfoRow('Full Name', name),
              buildInfoRow('Email', email),
              buildInfoRow('Phone Number', phone),
              const SizedBox(height: 30),
              CustomButton(
                backgroundColor: const Color(0xFF2E4A62),
                content: CustomText(
                  txt: 'Edit Profile',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () {
                  CustomSnackBar.show(
                    context,
                    message: 'Redirecting to edit profile...',
                    type: SnackBarType.success,
                  );
                  context.push(RouteNames.editProfile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}









// import 'package:carraze/core/widgets/custom_text.dart';
// import 'package:carraze/core/widgets/custom_button.dart';
// import 'package:carraze/core/widgets/custom_snack_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class UserProfileInfoPage extends StatelessWidget {
//   final String name;
//   final String email;
//   final String phone;

//   const UserProfileInfoPage({
//     super.key,
//     required this.name,
//     required this.email,
//     required this.phone,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: CustomText(
//           txt: 'Profile Info',
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => context.pop(),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/car1.jpg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.grey[800],
//                   child: const Icon(Icons.person, color: Colors.white, size: 60),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               CustomText(
//                 txt: 'Personal Information',
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//               const SizedBox(height: 15),
//               _buildInfoRow('Full Name', name),
//               _buildInfoRow('Email', email),
//               _buildInfoRow('Phone Number', phone),
//               const SizedBox(height: 30),
//               CustomButton(
//                 backgroundColor: const Color(0xFF2E4A62),
//                 content: CustomText(
//                   txt: 'Edit Profile',
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 onPressed: () {
//                   CustomSnackBar.show(
//                     context,
//                     message: 'Redirecting to edit profile...',
//                     type: SnackBarType.success,
//                   );
//                   context.push('/edit-profile');
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }


// }
