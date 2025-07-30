import 'package:carraze/core/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // SIGN UP
  Future<Either<String, UserModel>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String info,
    required String image,
  }) async {
    try {
      print('Attempting to create user with email: $email');

      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user!.uid;

      if (userCredential.user == null) {
        print('User creation failed unexpectedly');
        return Left('User creation failed unexpectedly');
      }

      // Ensure the user is fully authenticated
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // Small delay to ensure session
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser == null || currentUser.uid != uid) {
        print('User session not established');
        return Left('User session not established');
      }

      print('User created with UID: $uid');
      UserModel userModel = UserModel(
        uid: uid,
        email: email,
        name: name,
        phone: phone,
        info: info,
        image: image,
      );

      print('Attempting to save user data to Firestore');
      await _firestore
          .collection('users')
          .doc(uid)
          .set(userModel.toMap())
          .then((value) => print('Firestore write successful'))
          .catchError((error) => print('Firestore write error: $error'));

      // Verify the data was written
      final docSnapshot = await _firestore.collection('users').doc(uid).get();
      if (!docSnapshot.exists) {
        print('Firestore document does not exist after write');
        return Left('Failed to save user data to Firestore');
      }

      print('User data verified in Firestore: ${docSnapshot.data()}');
      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.code} - ${e.message}');
      return Left(e.message ?? 'Authentication failed');
    } catch (e) {
      print('Unexpected error: $e');
      return Left('An error occurred: $e');
    }
  }

  // LOG IN
  Future<Either<String, UserModel>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user!.uid;

      final doc = await _firestore.collection('users').doc(uid).get();

      if (!doc.exists) return Left("User data not found");

      final userModel = UserModel.fromMap(doc.data()!);

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "Authentication failed");
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }
}
