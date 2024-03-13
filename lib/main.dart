import 'package:flutter/material.dart';
import 'package:rest_api_ex/data/di.dart';
import 'package:rest_api_ex/ui/home_pages.dart';

void main() async {
  await initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePages(),
    );
  }
}
