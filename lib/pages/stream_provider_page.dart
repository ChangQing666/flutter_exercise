import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider/provider/stream_provider.dart';

class StreamProviderPage extends StatelessWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StreamProvider')),
      body: Center(child: Consumer<Label>(
        builder: (context, label, child) {
          return Text('value: ${label.name}');
        },
      )),
    );
  }
}

  

// const Scaffold(body: Center(child: Text('value: erson.name')));

