import 'package:go_router/go_router.dart';
import 'pages/LoginPage.dart';
import 'pages/HomePage.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  ],
);
