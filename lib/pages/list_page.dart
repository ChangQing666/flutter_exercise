import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListPage extends StatefulWidget {
  final String id;
  const ListPage({super.key, required this.id});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    print(widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          )
        ],
      ),
    );
  }
}
