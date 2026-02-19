import 'package:examplify/features/auth/bloc/auth_bloc.dart';
import 'package:examplify/features/auth/bloc/auth_state.dart';
import 'package:examplify/features/auth/screens/auth_container.dart';
import 'package:examplify/features/profile/profile_screen.dart';
import 'package:examplify/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'go_router_refresh_stream.dart';

class AppRouter{
  static GoRouter router(BuildContext context){
    return GoRouter(
      initialLocation: '/auth',
      redirect: (context, state){
        final authState = context.read<AuthBloc>().state;
        final isLoggedIn = authState.status == AuthStatus.loginSuccess;
        final isAuthRoute = state.matchedLocation.startsWith('/auth');

        if(!isLoggedIn && !isAuthRoute) return '/auth';
        if(isLoggedIn && isAuthRoute) return '/home';
        return null;
      },
      refreshListenable: GoRouterRefreshStream(
        context.read<AuthBloc>().stream,
      ),
      routes: [
        GoRoute(
          path: '/auth',
          builder: (context, state) => const AuthContainer()
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen()
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen()
        )
      ]
    );
  }
}