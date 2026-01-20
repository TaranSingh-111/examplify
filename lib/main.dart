import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:examplify/app/app.dart';
import 'package:examplify/data/repositories/auth_repository.dart';
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
      create: (_) => AuthRepository(),
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
