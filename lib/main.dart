import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/theme_provider.dart';
import 'package:flutter_provider/provider/top_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/routes/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: topProviders,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          routerConfig: appRouter,
          title: 'Flutter Provider',
          theme: context.watch<ThemeProvider>().getTheme(),
          darkTheme: context.watch<ThemeProvider>().getTheme(isDarkMode: true),
          themeMode: context.watch<ThemeProvider>().getThemeMode(),
        );
      },
    );
  }
}
