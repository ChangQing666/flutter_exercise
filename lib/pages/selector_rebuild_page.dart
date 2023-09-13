import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/selector_rebuild_provider.dart';
import 'package:provider/provider.dart';

class SelectorRebuildPage extends StatelessWidget {
  const SelectorRebuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SelectorRebuildPage')),
      floatingActionButton: floatingButtons(context),
      body: selectorBody(),
      // body: consumerBody(),
    );
  }

  // 使用Consumer生成的内容
  SafeArea consumerBody() {
    return SafeArea(
      child: Center(
        child: Consumer<NumberProvider>(
          builder: (context, provider, child) {
            debugPrint('SelectorRebuildPage=====rebuild');
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.redAccent,
                  padding: const EdgeInsets.all(10),
                  child: Text('number1：${provider.number1}',
                      style: const TextStyle(fontSize: 30)),
                ),
                Container(
                  color: Colors.greenAccent,
                  padding: const EdgeInsets.all(10),
                  child: Text('number2：${provider.number2}',
                      style: const TextStyle(fontSize: 30)),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  // 使用Selector生成的内容
  SafeArea selectorBody() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Selector<NumberProvider, int>(
              selector: (_, provider) => provider.number1,
              builder: (BuildContext context, number1, child) {
                debugPrint('SelectorRebuildPage=====rebuild==number1');
                return Container(
                  color: Colors.redAccent,
                  padding: const EdgeInsets.all(10),
                  child: Text('number1：$number1',
                      style: const TextStyle(fontSize: 30)),
                );
              },
            ),
            Selector<NumberProvider, int>(
              selector: (_, provider) => provider.number2,
              builder: (BuildContext context, number2, child) {
                debugPrint('SelectorRebuildPage=====rebuild==number2');
                return Container(
                  color: Colors.greenAccent,
                  padding: const EdgeInsets.all(10),
                  child: Text('number2：$number2',
                      style: const TextStyle(fontSize: 30)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Row floatingButtons(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: 'all',
            onPressed: () {
              context.read<NumberProvider>().add();
            },
            child: const Text('all'),
          ),
          FloatingActionButton(
            heroTag: '1',
            backgroundColor: Colors.redAccent,
            onPressed: () {
              context.read<NumberProvider>().addTo1();
            },
            child: const Text(' +1 '),
          ),
          FloatingActionButton(
            heroTag: '2',
            backgroundColor: Colors.greenAccent,
            onPressed: () {
              context.read<NumberProvider>().addTo2();
            },
            child: const Text(' +2 '),
          ),
        ]);
  }
}
