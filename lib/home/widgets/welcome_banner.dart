import 'package:flutter/material.dart';

class WelcomeBanner extends StatelessWidget {
  final String name;

  const WelcomeBanner({super.key, required this.name});

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