import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).matchedLocation;
    return Drawer(
      backgroundColor: Colors.grey,
      child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white)
                  )
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white24,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 32,
                      )
                    ),
                    SizedBox(height: 12,),
                    Text(
                      'Examplify',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 8,),

              //home
              _DrawerItem(
                icon: Icons.home_outlined,
                label: 'Home',
                isActive: currentPath == '/home',
                onTap: (){
                  context.go('/home');
                  Scaffold.of(context).closeDrawer();
                },
              ),

              //Profile
              _DrawerItem(
                icon: Icons.person_outlined,
                label: 'Profile',
                isActive: currentPath == '/profile',
                onTap: (){
                  context.go('/profile');
                  Scaffold.of(context).closeDrawer();
                },
              )
            ],
          )
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? Colors.white : Colors.white60,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white  : Colors.white60,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal
        ),
      ),
      tileColor: isActive ? Colors.white12 : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      onTap: onTap,
    );
  }
}
