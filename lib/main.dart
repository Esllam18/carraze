import 'package:carraze/features/auth/data/auth_remote_data_source.dart';
import 'package:carraze/features/auth/data/auth_repository_impl.dart';
import 'package:carraze/features/auth/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:carraze/core/router/app_router.dart';
import 'package:carraze/core/utils/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Carraze());
}

class Carraze extends StatelessWidget {
  const Carraze({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit(AuthRepositoryImpl(AuthRemoteDataSource())),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Carraze',
        theme: AppTheme.darkTheme,
        routerConfig: router,
      ),
    );
  }
}
