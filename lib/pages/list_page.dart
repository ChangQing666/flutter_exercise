import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  final String id;
  const ListPage({super.key, required this.id});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    debugPrint(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CountProvider countProvider = context.watch<CountProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('List page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('List page:${widget.id}'),
          InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: const Row(
                children: [
                  Expanded(child: Text('返回')),
                ],
              ),
            ),
          ),
          const Divider(),
          Text('数据：${countProvider.count}',
              style: const TextStyle(fontSize: 50, color: Colors.black87)),
          ElevatedButton(
              onPressed: () {
                countProvider.increment();
                debugPrint(countProvider.count.toString());
              },
              child: const Text('加',
                  style: TextStyle(fontSize: 20, color: Colors.redAccent))),
          ElevatedButton(
              onPressed: () {
                countProvider.decrement();
                debugPrint(countProvider.count.toString());
              },
              child: const Text('减',
                  style: TextStyle(fontSize: 20, color: Colors.greenAccent))),
          ElevatedButton(
              onPressed: () {
                context.pushNamed('detail', pathParameters: {'id': '123'});
              },
              child: const Text('跳转详情页',
                  style: TextStyle(fontSize: 20, color: Colors.greenAccent)))
        ],
      ),
    );
  }
}



// class ListPage extends StatefulWidget {
//   final String id;
//   const ListPage({super.key, required this.id});

//   @override
//   State<ListPage> createState() => _ListPageState();
// }

// class _ListPageState extends State<ListPage> {
//   @override
//   void initState() {
//     debugPrint(widget.id);
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var count = context.read<CountProvider>().count;

//     return Scaffold(
//       appBar: AppBar(title: const Text('List page')),
//       body: Consumer<CountProvider>(builder: (
//         BuildContext context,
//         CountProvider countProvider,
//         Widget? child,
//       ) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text('List page:${widget.id}'),
//             InkWell(
//               onTap: () {
//                 context.pop();
//               },
//               child: Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 height: 50,
//                 child: const Row(
//                   children: [
//                     Expanded(child: Text('返回')),
//                   ],
//                 ),
//               ),
//             ),
//             const Divider(),
//             Text('数据：${countProvider.count}'),
//             ElevatedButton(
//                 onPressed: () {
//                   countProvider.increment();
//                 },
//                 child: const Text('计数',
//                     style: TextStyle(fontSize: 20, color: Colors.white54)))
//           ],
//         );
//       }),
//     );
//   }
// }
