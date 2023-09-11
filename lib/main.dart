import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/theme_provider.dart';
import 'package:flutter_provider/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/routes/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  //监听系统Dark Mode变化
  @override
  void didChangePlatformBrightness() {
    context.read<ThemeProvider>().darkModeChange();
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      builder: (BuildContext context, Widget? child) {
        ThemeProvider themeProvider = context.watch<ThemeProvider>();
        return MaterialApp.router(
          routerConfig: appRouter,
          title: 'Flutter Provider',
          theme: themeProvider.getTheme(),
          darkTheme: themeProvider.getTheme(isDarkMode: true),
          themeMode: themeProvider.getThemeMode(),
        );
      },
    );
  }
}
