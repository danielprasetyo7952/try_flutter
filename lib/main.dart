import 'package:flutter/material.dart';
import 'theme.dart';
import 'route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData appsTheme = MediaQuery.of(context).platformBrightness == Brightness.dark ? darkTheme : lightTheme;

    return MaterialApp.router(
      routerConfig: router,
      title: "Trying Flutter",
      theme: appsTheme,
    );
  }
}
