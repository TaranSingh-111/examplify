import 'package:examplify/features/auth/screens/auth_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:examplify/features/auth/bloc/auth_bloc.dart';
import 'package:examplify/features/auth/bloc/auth_state.dart';
import 'package:examplify/features/auth/screens/login_screen.dart';
import 'package:examplify/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message))
            );
          }
        },
        builder: (context, state){
          if(state is AuthLoading){
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(),),
            );
          }

          if(state is AuthAuthenticated){
            return const HomeScreen();
          }

          return const AuthContainer();
        }
      );
  }
}
