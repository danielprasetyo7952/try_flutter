import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      constraints: const BoxConstraints(maxWidth: 800),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlutterLogo(size: 200),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome to the Home Page",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the login page
                context.go('/');
                // Alternatively, you can use Navigator.pop(context) if you want to go back in the navigation stack
                // Navigator.pop(context);
              },
              child: const Text("Go to Login Page"),
            ),
          ],
        ),
      ),
    );
  }
}
