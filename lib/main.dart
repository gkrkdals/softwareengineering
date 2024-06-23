import 'package:dd/menu.dart';
import 'package:dd/pages/nearby_hospitals/nearby_hospitals.dart';
import 'package:dd/pages/stroke_prediction/input_form.dart';
import 'package:dd/pages/stroke_prediction/stroke_prediction.dart';
import 'package:dd/pages/stroke_prevention.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: '뇌졸중 예방 프로그램'),
        '/prediction': (context) => const StrokePrediction(),
        '/prediction/input': (context) => const InputForm(),
        '/prevention': (context) => const StrokePrevention(),
        '/hospitals': (context) => const NearbyHospitals(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Menu(),
    );
  }
}
