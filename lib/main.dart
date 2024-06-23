import 'package:flutter/material.dart';

void main() {
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
      home: const MyHomePage(title: '뇌졸중 예방 프로그램'),
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
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 3),
        children: [
          Card(child: ListTile(
            leading: FlutterLogo(),
            title: Text('뇌졸중 자가 진단',),
            trailing: Icon(Icons.more_vert),
            onTap: () {

            },
          ),),
          Card(child: ListTile(
            leading: FlutterLogo(),
            title: Text('뇌졸중 예방 방법'),
            trailing: Icon(Icons.more_vert),
          ),),
          Card(child: ListTile(
            leading: FlutterLogo(),
            title: Text('가까운 병원'),
            trailing: Icon(Icons.more_vert),
            onTap: () {

            },
          ),),
        ],
      ),
    );
  }
}
