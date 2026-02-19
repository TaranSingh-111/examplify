import 'package:examplify/core/utils/app_drawer.dart';
import 'package:examplify/features/auth/bloc/auth_bloc.dart';
import 'package:examplify/features/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),),
      drawer: AppDrawer(),
      body: Column(
        children: [
          const Center(
            child: Text('Profile Screen')
          ),
          const SizedBox( height: 24,),
          
          FloatingActionButton(
              onPressed:() => context.read<AuthBloc>().add(LogoutEvent())
          )
        ],
      )
    );
  }
}
