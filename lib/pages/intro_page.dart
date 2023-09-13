import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IntroPage')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              count++;
            });
          },
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF6200EA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('count：$count',
                style: const TextStyle(fontSize: 30, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
