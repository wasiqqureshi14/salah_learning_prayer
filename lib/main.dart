import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/core/theme/app_theme.dart';
import 'package:salah_learning_prayer/screens/app_startup/app_startup_screen.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
    child: SalahApp(),
  ));
}

class SalahApp extends StatelessWidget {
  const SalahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namaz App',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      darkTheme: AppTheme.darkTheme,
      
      themeMode: ThemeMode.light,

     home: const AppStartup(),
    );
  }
}
