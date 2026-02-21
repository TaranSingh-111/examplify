import 'package:examplify/core/utils/app_drawer.dart';
import 'package:examplify/home/widgets/contribution_card.dart';
import 'package:examplify/home/widgets/update_tile.dart';
import 'package:examplify/home/widgets/welcome_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examplify/features/auth/bloc/auth_bloc.dart';
import 'package:examplify/features/auth/bloc/auth_state.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      final userName = state.user?.name ?? 'Student';

      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeBanner(name: userName),

            const SizedBox(height: 24),

            const Text(
              'Your contributions',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const Row(
              children: [
                Expanded(
                  child: ContributionCard(
                    title: 'Notes',
                    subtitle:
                    'You are 70% away from your diamond badge.',
                    progress: 0.3,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ContributionCard(
                    title: "PYQ'S / Solution",
                    subtitle:
                    'You are 40% away from your silver badge.',
                    progress: 0.4,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            const Text(
              'Latest Updates',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const UpdateTile(
              title: 'New semester notes uploaded',
              subtitle: 'Check the academic resources section.',
            ),
            const UpdateTile(
              title: 'Weekly test available',
              subtitle: 'Attempt now to track your progress.',
            ),
          ],
        ),
      );
    },
    ),
    );
  }
}

class _WelcomeBanner extends StatelessWidget {
  final String name;

  const _WelcomeBanner({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0A3A4A), Color(0xFF04151F)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, $name',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "You've completed 70% of your weekly tasks. Keep it up!",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const CircleAvatar(
            radius: 26,
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
