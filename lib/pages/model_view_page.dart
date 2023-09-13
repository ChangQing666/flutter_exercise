import 'package:flutter/material.dart';
import 'package:flutter_provider/common/color.dart';
import 'package:flutter_provider/provider/theme_provider.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';

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
      body: Stack(
        alignment: Alignment.center,
        children: [
          const ModelViewer(
            backgroundColor: Color.fromRGBO(192, 192, 191, 1),
            // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
            src: 'assets/models/Astronaut.glb',
            poster: 'assets/models/Astronaut.jpg',
            alt: 'A 3D model of an astronaut',
            ar: true,
            autoRotate: true,
            iosSrc:
                'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
            disableZoom: true,
            autoPlay: true,
            loading: Loading.eager,
          ),
          FutureBuilder(
              future: Future.delayed(const Duration(seconds: 1)),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return Positioned(
                      top: 10,
                      left: 10,
                      child: Text(
                        '航天员',
                        style: TextStyle(
                            color: context.read<ThemeProvider>().isDark()
                                ? orangeColor
                                : primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}
