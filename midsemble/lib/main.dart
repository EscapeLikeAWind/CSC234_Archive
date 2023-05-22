import 'package:midsemble/NewWorldOrder.dart';

import 'package:flutter/material.dart';
import 'package:midsemble/widgets/Detail1.dart';
import 'package:midsemble/widgets/Detail2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSC234 Midterm Ensemble',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomelandPortal(),
      routes: {
        Detail1.routeName: (context) => const Detail1(),
        Detail2.routeName: (context) => const Detail2(),
      },
    );
  }
}

class HomelandPortal extends StatelessWidget {
  const HomelandPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSC234 Midterm Test'),
      ),
      body: const NewWorldOrder(),
    );
  }
}
