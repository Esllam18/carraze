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
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user!.uid;

      UserModel userModel = UserModel(
        uid: uid,
        email: email,
        name: name,
        phone: phone,
        info: info,
        image: image,
      );

      await _firestore.collection('users').doc(uid).set(userModel.toMap());

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "Something went wrong");
    } catch (e) {
      return Left(e.toString());
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
      return Left(e.toString());
    }
  }
}
