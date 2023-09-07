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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: const ModelViewer(
          backgroundColor: Color.fromRGBO(192, 192, 191, 1),
          // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          src: 'assets/models/Astronaut.glb',
          alt: 'A 3D model of an astronaut',
          ar: true,
          autoRotate: true,
          iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          disableZoom: true,
        ),
      ),
    );
  }
}
