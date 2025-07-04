import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mim App',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splashRoute,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
