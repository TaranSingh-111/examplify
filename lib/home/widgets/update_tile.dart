import 'package:flutter/material.dart';

class UpdateTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const UpdateTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.notifications),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}