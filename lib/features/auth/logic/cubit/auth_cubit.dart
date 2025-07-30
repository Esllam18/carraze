import 'dart:io';
import 'package:carraze/core/errors/firebase_exceptions.dart';
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
      emit(AuthFailure(mapFirebaseAuthException(e)));
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
      emit(AuthFailure(mapFirebaseAuthException(e)));
    } catch (e) {
      emit(AuthFailure('An unexpected error occurred: $e'));
    }
  }
}
