import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/selector_provider.dart';
import 'package:provider/provider.dart';

class SelectorPage extends StatelessWidget {
  const SelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SelectorPage')),
      body: Center(
          child: Selector<UserModel, int>(
        selector: (BuildContext context, UserModel userModel) {
          return userModel.score;
        },
        builder: (BuildContext context, age, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(age.toString(),
                  style: const TextStyle(fontSize: 30, color: Colors.red)),
              child!,
            ],
          );
        },
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                context.read<UserModel>().increaseScore();
              },
              child: const Text('改变分数'),
            )),
      )),
    );
  }
}
