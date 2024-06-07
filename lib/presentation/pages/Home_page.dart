import 'package:flutter/material.dart';
import 'package:spacex_test/presentation/pages/launches_list_page.dart';

import 'missions_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('SpaceX')),
      body:Center(child:Row(
        children: [
          ElevatedButton(onPressed: (){ Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LaunchesListPage()));}, child: Text('Launches')),
          ElevatedButton(onPressed: (){ Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MissionsListPage()));}, child: Text('Missions')),
        ],
      ))
    );
  }
}
