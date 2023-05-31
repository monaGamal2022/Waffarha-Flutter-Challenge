import 'package:flutter/material.dart';
import 'package:waffarha_challenge/photos_gallery/screens/photos_gallery_screen.dart';

import 'di/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waffarha Challenge',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PhotosGalleryScreen(),
    );
  }
}
