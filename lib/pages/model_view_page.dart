import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewPage extends StatefulWidget {
  const ModelViewPage({super.key});

  @override
  State<ModelViewPage> createState() => _ModelViewPageState();
}

class _ModelViewPageState extends State<ModelViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3D model')),
      body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else {
                return const ModelViewer(
                  backgroundColor: Color.fromRGBO(192, 192, 191, 1),
                  // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                  src: 'assets/models/Astronaut.glb',
                  poster: 'assets/models/Astronaut.jpg',
                  alt: 'A 3D model of an astronaut',
                  ar: true,
                  autoRotate: true,
                  // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                  disableZoom: true,
                  autoPlay: true,
                  loading: Loading.eager,
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
