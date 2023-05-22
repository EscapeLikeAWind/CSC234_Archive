import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSC234 Midterm Test 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Exam.'),
      ),
      body: Column(children: [
        Image.asset('assets/images/tak.jpg'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.favorite,
              color: Colors.red[500],
            ),
            Icon(
              Icons.audiotrack,
              color: Colors.green[500],
            ),
            Icon(
              Icons.beach_access,
              color: Colors.blue[500],
            ),
            Text(
              'My Std. Id is : 64130500226',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        Text(
          'My name is Poopa Kaewbuapan',
          style: TextStyle(fontSize: 32, color: Colors.red[500]),
        )
      ]),
    );
  }
}
