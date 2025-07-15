import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:try_flutter/components/MenuItems.dart';

final List<Map<String, dynamic>> _menuItems = [
  {'title': 'Home', 'icon': Icons.home, 'page': '/home'},
  {'title': 'To-Do List', 'icon': Icons.list, 'page': '/todo'},
  {'title': 'Settings', 'icon': Icons.settings, 'page': '/settings'},
];

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      );
    }
    return AppBar(
      title: Row(
        children: [
          const FlutterLogo(size: 26),
          const SizedBox(width: 10),
          Text('Flutter', style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
      actions: [
        ..._menuItems.map((item) => buildNavItems(context, item['title'], item['icon'], item['page'])),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            context.go('/');
          },
        ),
      ],
    );
  }
}
