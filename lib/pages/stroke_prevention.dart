import 'package:flutter/material.dart';

class StrokePrevention extends StatefulWidget {
  const StrokePrevention({super.key});

  @override
  State<StatefulWidget> createState() => _StrokePreventionState();
}

class _StrokePreventionState extends State<StrokePrevention> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Stroke Preventionm Methods'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(

        ),
      )
    );
  }
}
