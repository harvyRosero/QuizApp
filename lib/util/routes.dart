import 'package:quiz/screens/home_page.dart';
import 'package:quiz/screens/login.screen.dart';
import 'package:quiz/screens/register.screen.dart';
import 'package:quiz/screens/settings_screen.dart';
import 'package:quiz/screens/learn.screen.dart';

final routes_ = {
  '/': (context) => const LoginScreen(),
  '/register': (context) => const RegisterForm(),
  '/home': (context) => const HomePage(),
  '/settings': (context) => const SettingsScreen(),
  '/learn': (context) => const LearnScreen(),
};
