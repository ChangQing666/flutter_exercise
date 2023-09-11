import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider/provider/future_provider.dart';

class FutureProviderPage extends StatelessWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FutureProvider')),
      body: Center(child: Consumer<Person>(
        builder: (context, person, child) {
          return Text('value: ${person.name}');
        },
      )),
    );
  }
}

  

// const Scaffold(body: Center(child: Text('value: erson.name')));

