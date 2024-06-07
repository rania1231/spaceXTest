import 'package:flutter/material.dart';

import '../../../domain/entities/mission/mission.dart';
import '../../pages/mission_detail_page.dart';

class MissionsListWidget extends StatelessWidget {
  const MissionsListWidget({super.key, required this.missions});
  final List<Mission> missions;

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount:missions.length ,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(missions[index].mission_name,style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MissionDetailsPage(
                      mission: missions[index],
                    )));
          }//Navigator.push(context, route),
        );
        },

          );
  }
}
