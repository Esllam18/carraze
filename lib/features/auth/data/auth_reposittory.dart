import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:carraze/core/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<String, UserModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String info,
    required String image,
  });

  Future<Either<String, UserModel>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<String> uploadProfileImage(File imageFile);
}
