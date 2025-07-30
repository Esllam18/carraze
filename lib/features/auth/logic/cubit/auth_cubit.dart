import 'dart:io';
import 'package:carraze/features/auth/data/auth_reposittory.dart';
import 'package:carraze/features/auth/logic/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final result = await authRepository.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      result.fold(
        (error) => emit(AuthFailure(error)),
        (user) => emit(AuthSuccess(user)),
      );
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_mapFirebaseAuthException(e)));
    } catch (e) {
      emit(AuthFailure('An unexpected error occurred: $e'));
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String info,
    required File image,
  }) async {
    emit(AuthLoading());
    try {
      // Ensure user is created first
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user == null) {
        emit(AuthFailure('User creation failed'));
        return;
      }
      await Future.delayed(const Duration(milliseconds: 500)); // Ensure session
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        emit(AuthFailure('User session not established'));
        return;
      }

      // Upload image after authentication
      final imageUrl = await authRepository.uploadProfileImage(image);
      final result = await authRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
        phone: phone,
        info: info,
        image: imageUrl,
      );
      result.fold(
        (error) => emit(AuthFailure(error)),
        (user) => emit(AuthSuccess(user)),
      );
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(_mapFirebaseAuthException(e)));
    } catch (e) {
      emit(AuthFailure('An unexpected error occurred: $e'));
    }
  }

  String _mapFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'Authentication failed: ${e.message}';
    }
  }
}
