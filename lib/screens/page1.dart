import 'dart:math';

import 'package:blog_app/screens/counter.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Page One"),
            // Text("${MyInheritedWidget.of(context)?.counter}"),
            CounterScreen(counter: counter),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter = Random().nextInt(100);
                });
              },
              child: const Text("to page 2"),
            )
          ],
        ),
      ),
    );
  }
}
