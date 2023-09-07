import 'package:flutter/material.dart';

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
    print(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail page')),
      body: Center(
        child: Text('Detail page:${widget.id}'),
      ),
    );
  }
}
