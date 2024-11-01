
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.counter});
  final int counter;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CounterScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("old counter ${oldWidget.counter}");
    print("new counter ${widget.counter}");
  }

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
        onPressed: () {
          
        },
        child: const Text("did change"));
  }
}
