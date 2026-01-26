import 'package:examplify/data/services/api_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:examplify/app/app.dart';
import 'package:examplify/data/repositories/auth_repository.dart';
import 'package:examplify/features/auth/bloc/auth_event.dart';
import 'package:examplify/features/auth/bloc/auth_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthRepository(
        apiAuthService: ApiAuthService(
            baseUrl: 'https://examplify-backend-2026.vercel.app/v1/api',
            defaultHeaders: const{}
        )
      ),
      child: BlocProvider(
        create: (context) =>
          AuthBloc(authRepository: context.read<AuthRepository>()),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: App()
        ),
      ),
    );
  }
}
