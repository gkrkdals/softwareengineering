import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StrokePrediction extends StatefulWidget {
  const StrokePrediction({super.key});

  @override
  State<StatefulWidget> createState() => _StrokePredictionState();
}

class _StrokePredictionState extends State<StrokePrediction> {

  var box = Hive.openBox('user');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Stroke Prediction'),
      ),
      body: FutureBuilder(
        future: box,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data!.get('user') == null) {
              Future.delayed(const Duration(microseconds: 300),
                () {
                  showDialog(context: context, builder: (dContext) {
                    return AlertDialog(
                      content: const Text("There's no user data.\nDo you want to make new user data?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(dContext).pop();
                            Navigator.of(context).pop();
                            Navigator.of(dContext).pushNamed('/prediction/input');
                          },
                          child: const Text('Yes')
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(dContext).pop(),
                          child: const Text('No')
                        )
                      ],
                    );
                  });
                }
              );
              return const Center(child: Text("There's no data."),);
            } else {

            }
          }
          return const Center(child: Text("There's no data."),);
        },
      ),
    );
  }
}
