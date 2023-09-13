import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final String id;
  final String? filter;
  const DetailPage({super.key, required this.id, this.filter});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    CountProvider countProvider = context.watch<CountProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Detail page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('数据:${countProvider.count}',
              style: const TextStyle(fontSize: 50)),
          ElevatedButton(
              onPressed: () {
                countProvider.decrement();
              },
              child: const Text('减', style: TextStyle(fontSize: 30))),
          const Divider(),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('返回',
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          // Text('Detail page:${widget.id}'),
        ],
      ),
    );
  }
}
