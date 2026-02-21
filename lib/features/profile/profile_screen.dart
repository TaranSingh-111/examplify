import 'package:examplify/core/utils/app_drawer.dart';
import 'package:examplify/features/auth/bloc/auth_bloc.dart';
import 'package:examplify/features/auth/bloc/auth_event.dart';
import 'package:examplify/features/auth/bloc/auth_state.dart';
import 'package:examplify/features/profile/widgets/pofile_header.dart';
import 'package:examplify/features/profile/widgets/profile_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF071E26),
      appBar: AppBar(title: const Text('Profile',style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),),backgroundColor: const Color(0xFF071E26),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: const AppDrawer(),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
          final user = state.user;

          if (user == null) {
            return const Center(child: Text('No user data'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ProfileHeader(
                  name: user.name,
                  role: user.role,
                ),

                const SizedBox(height: 24),

                ProfileInfoCard(
                  name: user.name,
                  role: user.role,
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        context.read<AuthBloc>().add(LogoutEvent()),
                    icon: const Icon(Icons.logout,color: Colors.white,),
                    label: const Text('Logout' , style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _InfoTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}