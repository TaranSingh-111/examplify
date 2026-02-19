import 'package:examplify/app/router/app_routes.dart';
import 'package:examplify/features/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:examplify/app/app.dart';
import 'package:examplify/data/repositories/auth_repository.dart';
import 'package:examplify/features/auth/bloc/auth_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  await dotenv.load(fileName: 'api_base.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = AuthBloc(authRepository: AuthRepository());
        bloc.add(CheckAuthStatusEvent());
        return bloc;
      },
      child: Builder(
          builder: (context){
            return MaterialApp.router(
              title: 'Examplify',
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router(context),
            );
          }
        )
    );
  }
}
