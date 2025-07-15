import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _NavMenuItem extends StatelessWidget {
  const _NavMenuItem({Key? key, required this.title, required this.icon, required this.onTap})
    : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(children: [Icon(icon), const SizedBox(width: 8), Text(title)]),
      ),
    );
  }
}

class _SideMenuItem extends StatelessWidget {
  const _SideMenuItem({Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}

Widget buildNavItems(BuildContext context, String title, dynamic icon, String page) {
  return Column(
    children: [
      _NavMenuItem(
        title: title,
        icon: icon,
        onTap: () {
          context.go(page);
        },
      ),
    ],
  );
}

Widget buildDrawerItem(BuildContext context, String title, IconData icon, String page) {
  return Column(
    children: [
      _SideMenuItem(
        title: title,
        icon: icon,
        onTap: () {
            context.go(page);
          },
      )
    ],
  );
}
