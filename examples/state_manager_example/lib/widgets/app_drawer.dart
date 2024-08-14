import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('State Management Demo',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: const Text('Counter Screen'),
            onTap: () => Navigator.pushNamed(context, '/counter'),
          ),
          ListTile(
            title: const Text('Async Data Screen'),
            onTap: () => Navigator.pushNamed(context, '/async'),
          ),
          ListTile(
            title: const Text('Scoped State Screen'),
            onTap: () => Navigator.pushNamed(context, '/scoped'),
          ),
          ListTile(
            title: const Text('Persistent Counter Screen'),
            onTap: () => Navigator.pushNamed(context, '/persistent'),
          ),
        ],
      ),
    );
  }
}
