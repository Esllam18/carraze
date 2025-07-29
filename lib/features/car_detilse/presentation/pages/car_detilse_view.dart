import 'package:carraze/core/widgets/custom_snackbar.dart';
import 'package:carraze/core/widgets/custom_text.dart';
import 'package:carraze/core/widgets/custom_button.dart';
import 'package:carraze/features/car_detilse/presentation/pages/widgets/buildSpecRow.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarDetailsPage extends StatelessWidget {
  // Hardcoded sample data
  final String carName = 'Toyota Camry';
  final String manufacturer = 'Toyota';
  final String model = 'Camry';
  final String year = '2023';
  final String fuelType = 'Petrol';
  final String mileage = '15,000';
  final String price = '30,000';
  final String imagePath = 'assets/car1.jpg';

  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,

        title: CustomText(
          txt: 'Car Details',
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
              Center(
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomText(
                txt: carName,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              CustomText(
                txt: '$manufacturer $model ($year)',
                fontSize: 18,
                color: Colors.white70,
              ),
              const SizedBox(height: 20),
              buildSpecRow('Manufacturer', manufacturer),
              buildSpecRow('Model', model),
              buildSpecRow('Year', year),
              buildSpecRow('Fuel Type', fuelType),
              buildSpecRow('Price', '\$$price'),
              buildSpecRow('Mileage', '$mileage km'),
              const SizedBox(height: 30),
              CustomButton(
                backgroundColor: const Color(0xFF2E4A62),
                content: CustomText(
                  txt: 'Add to Favorites',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                onPressed: () {
                  CustomSnackBar.show(
                    context,
                    message: '$carName added to favorites!',
                    type: SnackBarType.success,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}










































// import 'package:carraze/core/widgets/custom_snackbar.dart';
// import 'package:carraze/core/widgets/custom_text.dart';
// import 'package:carraze/core/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class CarDetailsPage extends StatelessWidget {
//   final String carName;
//   final String manufacturer;
//   final String model;
//   final String year;
//   final String fuelType;
//   final String mileage;
//   final String price;
//   final String imagePath;

//   const CarDetailsPage({
//     super.key,
//     required this.carName,
//     required this.manufacturer,
//     required this.model,
//     required this.year,
//     required this.fuelType,
//     required this.mileage,
//     required this.price,
//     required this.imagePath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: CustomText(
//           txt: 'Car Details',
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
//               Center(
//                 child: Container(
//                   width: double.infinity,
//                   height: 250,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     image: DecorationImage(
//                       image: AssetImage(imagePath),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               CustomText(
//                 txt: carName,
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//               const SizedBox(height: 10),
//               CustomText(
//                 txt: '$manufacturer $model ($year)',
//                 fontSize: 18,
//                 color: Colors.white70,
//               ),
//               const SizedBox(height: 20),
//               _buildSpecRow('Manufacturer', manufacturer),
//               _buildSpecRow('Model', model),
//               _buildSpecRow('Year', year),
//               _buildSpecRow('Fuel Type', fuelType),
//               _buildSpecRow('Mileage', '$mileage km'),
//               _buildSpecRow('Price', '\$$price'),
//               const SizedBox(height: 30),
//               CustomButton(
//                 backgroundColor: const Color(0xFF2E4A62),
//                 content: CustomText(
//                   txt: 'Add to Favorites',
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 onPressed: () {
//                   CustomSnackBar.show(
//                     context,
//                     message: '$carName added to favorites!',
//                     type: SnackBarType.success,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSpecRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CustomText(
//             txt: label,
//             fontSize: 16,
//             color: Colors.white70,
//           ),
//           CustomText(
//             txt: value,
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }