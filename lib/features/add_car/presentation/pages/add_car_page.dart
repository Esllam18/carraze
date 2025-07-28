import 'dart:io';

import 'package:carraze/core/widgets/custom_snackbar.dart';
import 'package:carraze/core/widgets/custom_text.dart';
import 'package:carraze/features/add_car/presentation/pages/widgets/add_car_view_body.dart';
import 'package:carraze/features/add_car/presentation/pages/widgets/add_image_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({super.key});

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _modelController = TextEditingController();
  final _priceController = TextEditingController();
  final _infoController = TextEditingController();
  final _manufacturerController = TextEditingController();
  final _fuelTypeController = TextEditingController();
  final _mileageController = TextEditingController();
  final _yearController = TextEditingController();

  File? _image;

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
        CustomSnackBar.show(
          context,
          message: 'Image selected successfully',
          type: SnackBarType.success,
        );
      } else {
        CustomSnackBar.show(
          context,
          message: 'No image selected',
          type: SnackBarType.info,
        );
      }
    } catch (e) {
      CustomSnackBar.show(
        context,
        message: 'Error picking image: $e',
        type: SnackBarType.error,
      );
      print('Image picking error: $e');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _modelController.dispose();
    _priceController.dispose();
    _infoController.dispose();
    _manufacturerController.dispose();
    _fuelTypeController.dispose();
    _mileageController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          txt: 'Add New Car',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pushReplacement('/home'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/car1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: CustomAddImageCard(
                  onPickImage: _pickImage,
                  image: _image,
                ),
              ),
              AddCarViewBody(
                formKey: _formKey,
                nameController: _nameController,
                modelController: _modelController,
                priceController: _priceController,
                infoController: _infoController,
                manufacturerController: _manufacturerController,
                fuelTypeController: _fuelTypeController,
                mileageController: _mileageController,
                yearController: _yearController,
                onAddCarPressed: () {
                  if (_formKey.currentState!.validate()) {
                    CustomSnackBar.show(
                      context,
                      message: 'Car added successfully!',
                      type: SnackBarType.success,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
