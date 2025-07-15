import 'package:flutter/material.dart';
import 'package:try_flutter/components/MenuItems.dart';

final List<Map<String, dynamic>> _menuItems = [
  {'title': 'Home', 'icon': Icons.home, 'page': '/home'},
  {'title': 'To-Do List', 'icon': Icons.list, 'page': '/todo'},
  {'title': 'Settings', 'icon': Icons.settings, 'page': '/settings'},
  {'title': 'Logout', 'icon': Icons.logout, 'page': '/'},
];

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
          ..._menuItems.map((item) => buildDrawerItem(context, item['title'], item['icon'], item['page'])),
        ],
      ),
    );
  }
}
