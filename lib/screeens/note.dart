import 'package:flutter/material.dart';
import 'package:studentapp/mainscreenpart/questionbank.dart';

class Notepage extends StatefulWidget {
  const Notepage({super.key});

  @override
  State<Notepage> createState() => _NotepageState();
}

class _NotepageState extends State<Notepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: const Text('Note'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Column(
        children: [
          Part2(),
        ],
      ),
    );
  }
}
