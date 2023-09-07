import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
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
  void initState() {
    debugPrint(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CountProvider countProvider = context.watch<CountProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Detail page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('Detail page:${widget.id}'),
          ),
          const Divider(),
          Text('count:${countProvider.count}'),
          ElevatedButton(
              onPressed: () {
                countProvider.decrement();
                debugPrint(countProvider.count.toString());
              },
              child: const Text('减',
                  style: TextStyle(fontSize: 20, color: Colors.white54)))
        ],
      ),
    );
  }
}
