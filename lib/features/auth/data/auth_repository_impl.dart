import 'dart:io';
import 'package:carraze/features/auth/data/auth_remote_data_source.dart';
import 'package:carraze/core/models/user_model.dart';
import 'package:carraze/features/auth/data/auth_reposittory.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, UserModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String info,
    required String image,
  }) async {
    return remoteDataSource.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
      phone: phone,
      info: info,
      image: image,
    );
  }

  @override
  Future<Either<String, UserModel>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return remoteDataSource.logInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<String> uploadProfileImage(File imageFile) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(
        'profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      // ignore: unused_local_variable
      final uploadTask = await storageRef.putFile(imageFile);
      final downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Image upload failed: $e');
    }
  }
}
