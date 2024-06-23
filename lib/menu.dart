import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  final List<Map<String, String>> menus = [
    {
      'menu': 'Stroke Prediction & Prevention',
      'route': '/prediction'
    },
    {
      'menu': 'Stroke Prevention Methods',
      'route': '/prevention'
    },
    {
      'menu': 'Show Nearby Hospitals',
      'route': '/hospitals'
    }
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(menus.length, (idx) {
          return Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), child: Card(child: ListTile(
            leading: const FlutterLogo(),
            title: Text(menus[idx]['menu']!,),
            trailing: const Icon(Icons.more_vert),
            onTap: () {
              Navigator.of(context).pushNamed(menus[idx]['route']!);
            },
          ),),);
        }),
      ),
    );
  }

}
