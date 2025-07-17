import 'package:go_router/go_router.dart';
import 'pages/LoginPage.dart';
import 'pages/HomePage.dart';
import 'pages/ToDoListPage.dart';
import 'pages/SettingPage.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    GoRoute(path: '/todo', builder: (context, state) => const ToDoListPage()),
    GoRoute(path: '/settings', builder: (context, state) => const SettingPage()),
  ],
);
