import 'package:flutter/material.dart';
import 'info_title.dart';

class ProfileInfoCard extends StatelessWidget {
  final String name;
  final String role;

  const ProfileInfoCard({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0F2A33), // ✅ solid dark card
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          InfoTile(
            icon: Icons.person_outline,
            label: 'Name',
            value: name,
          ),
          InfoTile(
            icon: Icons.badge_outlined,
            label: 'Role',
            value: role,
          ),

          // ✅ YOUR STATIC DATA
          const InfoTile(
            icon: Icons.numbers,
            label: 'Student Number',
            value: '241010',
          ),
          const InfoTile(
            icon: Icons.confirmation_number_outlined,
            label: 'Roll Number',
            value: '2400270100110',
          ),
          const InfoTile(
            icon: Icons.school_outlined,
            label: 'Branch',
            value: 'CSE',
          ),
          const InfoTile(
            icon: Icons.group_outlined,
            label: 'Section',
            value: 'CSE - 2',
          ),
        ],
      ),
    );
  }
}