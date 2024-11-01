import 'package:blog_app/screens/my_inherited_widget.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          children: [
            const Text("Page three"),
            Text("${MyInheritedWidget.of(context)?.counter}"),
            const Text("3"),
          ],
        ),
      ),
    );
  }
}