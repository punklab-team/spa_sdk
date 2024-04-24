import 'package:flutter/material.dart';
import 'package:spa_sdk/spa_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SpaSdk _spaSdkPlugin = SpaSdk.instance(counterId: "613", uriServiceSpa: "");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Actual plugin example'),
        ),
        body: const Center(
          child: Column(
            children: [
            ],
          ),
        ),
      ),
    );
  }
}
