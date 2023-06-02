import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffarha_challenge/core/request/base_request.dart';
import 'package:waffarha_challenge/photos_gallery/logic/cubit/photos_cubit.dart';
import 'package:waffarha_challenge/photos_gallery/screens/photos_gallery_screen.dart';

import 'di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ),
  );
  BaseRequestDefaults.instance
      .setBaseUrl("https://jsonplaceholder.typicode.com");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waffarha Challenge',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => getIt<PhotosGalleryCubit>(),
        child: const PhotosGalleryScreen(),
      ),
    );
  }
}
