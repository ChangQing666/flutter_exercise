import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Recommand page',
              style: TextStyle(fontSize: 30, color: Colors.red)),
          Text(
              '当前是否为暗黑模式：${context.read<ThemeProvider>().isDark() ? '是' : '否'}',
              style: const TextStyle(fontSize: 20)),
        ],
      ),
    ));
  }
}
