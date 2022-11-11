import 'package:flutter/material.dart';

import 'package:images_app/views/images_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixabay Images',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImagesGridView(),
    );
  }
}
