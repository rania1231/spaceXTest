import 'package:flutter/material.dart';
import 'package:spacex_test/presentation/pages/launches_list_page.dart';

import 'missions_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('SpaceX')),
      body:Center(
        child: Container(
          width: 300,
          height: 500,
          color: Colors.purple[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child:Column(
              children: [
                SizedBox(height: 150,),
                ElevatedButton(onPressed: (){ Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LaunchesListPage()));}, child: Text('Launches')),

                SizedBox(height: 70,),
                ElevatedButton(onPressed: (){ Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MissionsListPage()));}, child: Text('Missions')),
              ],
            )),
          ),
        ),
      )
    );
  }
}
