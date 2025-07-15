import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      return AppBar(
        title: Text("Home Page", style: Theme.of(context).textTheme.bodyLarge),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      );
    }
    return AppBar(
      title: Text("Home Page", style: Theme.of(context).textTheme.bodyLarge),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Navigate back to the login page
            context.go('/');
            // Alternatively, you can use Navigator.pop(context) if you want to go back in the navigation stack
            // Navigator.pop(context);
          },
        ),
      ],
    );
  }
}