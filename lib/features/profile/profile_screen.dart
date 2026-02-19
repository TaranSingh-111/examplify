import 'package:examplify/core/utils/app_drawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),),
      drawer: AppDrawer(),
      body: const Center(
        child: Text('Profile Screen')
      )
    );
  }
}
