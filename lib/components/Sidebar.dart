import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const FlutterLogo(size: 56),
                const SizedBox(width: 16),
                Text(
                  'Flutter',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              context.go('/home');
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              context.go('/settings');
            },
          ),
          const _Separator(),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              // Navigate back to the login page
              context.go('/');
              // Alternatively, you can use Navigator.pop(context) if you want to go back in the navigation stack
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).dividerColor,
      height: 1,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );
  }
}
