import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    IconData darkModeIcon = themeProvider.isDark()
        ? Icons.nightlight_round
        : Icons.wb_sunny_rounded;
    return Scaffold(
        // appBar: AppBar(title: const Text('My page')),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text('设置', style: TextStyle(fontSize: 18)),
        ),
        ListTile(
          leading: Icon(darkModeIcon),
          title: const Text('夜间模式'),
          onTap: () {
            context.pushNamed('dark_mode');
          },
          trailing: const Icon(Icons.navigate_next),
          shape:
              const Border(bottom: BorderSide(width: 1, color: Colors.black12)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('关于'),
          onTap: () {
            context.pushNamed('intro_page');
          },
          trailing: const Icon(Icons.navigate_next),
          shape:
              const Border(bottom: BorderSide(width: 1, color: Colors.black12)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text('实验', style: TextStyle(fontSize: 18)),
        ),
        ListTile(
            leading: const Icon(Icons.vrpano),
            title: const Text('3D model'),
            onTap: () {
              context.pushNamed('model_view');
            },
            trailing: const Icon(Icons.navigate_next),
            shape: const Border(
                bottom: BorderSide(width: 1, color: Colors.black12)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
      ],
    ));
  }
}
