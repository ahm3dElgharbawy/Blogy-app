import 'package:blog_app/core/helpers/navigation/extensions.dart';
import 'package:blog_app/screens/my_inherited_widget.dart';
import 'package:blog_app/screens/page3.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            const Text("Page Two"),
            Text("${MyInheritedWidget.of(context)?.counter}"),
            const Text("2"),
            ElevatedButton(
              onPressed: () {
                context.push(const Page3());
              },
              child: const Text("to page 3"),
            )
          ],
        ),
      ),
    );
  }
}
