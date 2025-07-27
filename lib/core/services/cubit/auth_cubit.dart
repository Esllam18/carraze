// import 'package:bloc/bloc.dart';

// import 'package:youtube/core/services/auth_service.dart';
// import 'package:youtube/core/services/cubit/auth_state.dart';



// class AuthCubit extends Cubit<AuthState> {
//   final AuthService authService;

//   AuthCubit({required this.authService}) : super(AuthInitial());

//   Future<void> signIn(String email, String password) async {
//     emit(AuthLoading());
//     try {
//       final success = await authService.signIn(email, password);
//       if (success) {
//         emit(AuthAuthenticated(token: authService.getToken()));
//       } else {
//         emit(AuthError('Sign in failed'));
//       }
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future<void> signUp(String email, String password, String name) async {
//     emit(AuthLoading());
//     try {
//       final success = await authService.signUp(email, password, name);
//       if (success) {
//         emit(AuthAuthenticated(token: authService.getToken()));
//       } else {
//         emit(AuthError('Sign up failed'));
//       }
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future<void> signOut() async {
//     await authService.signOut();
//     emit(AuthInitial());
//   }
// }