import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountRebuildPage extends StatelessWidget {
  const CountRebuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('CountRebuildPage build');
    // return Scaffold(
    //   appBar: AppBar(title: const Text('CountRebuildPage')),
    //   body: Consumer(
    //     builder:
    //         (BuildContext context, CountProvider countProvider, Widget? child) {
    //       return Center(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Column(
    //               children: [
    //                 Text('Count:${countProvider.count}',
    //                     style: const TextStyle(
    //                         fontSize: 20, color: Colors.blueAccent)),
    //                 const Column(
    //                   children: [
    //                     Text('其它组件1'),
    //                     Text('其它组件2'),
    //                     Text('其它组件3'),
    //                     Text('其它组件4'),
    //                     Text('其它组件5'),
    //                   ],
    //                 ),
    //                 ElevatedButton(
    //                     onPressed: () {
    //                       context.read<CountProvider>().increment();
    //                     },
    //                     child: const Text('+1'))
    //               ],
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),

    // consumer child优化后
    return Scaffold(
      appBar: AppBar(title: const Text('CountRebuildPage')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(
              builder: (BuildContext context, CountProvider countProvider,
                  Widget? child) {
                return Column(
                  children: [
                    Text('Count:${countProvider.count}',
                        style: const TextStyle(
                            fontSize: 20, color: Colors.blueAccent)),
                    child as Widget,
                    ElevatedButton(
                        onPressed: () {
                          context.read<CountProvider>().increment();
                        },
                        child: const Text('+1'))
                  ],
                );
              },
              child: const Column(
                children: [
                  Text('其它组件1'),
                  Text('其它组件2'),
                  Text('其它组件3'),
                  Text('其它组件4'),
                  Text('其它组件5'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CountProvider>().increment();
          // Provider.of<CountProvider>(context, listen: false).increment();
        },
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}

class OtherWidget2 extends StatelessWidget {
  const OtherWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('OtherWidget2 build');
    return Text(
        'OtherWidget2:${context.watch<CountProvider>().count.toString()}',
        style: const TextStyle(fontSize: 20, color: Colors.blueAccent));
  }
}
