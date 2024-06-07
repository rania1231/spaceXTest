import 'package:flutter/material.dart';

import '../../../domain/entities/mission/mission.dart';



class MissionDetailsWidget extends StatelessWidget {
  const MissionDetailsWidget({super.key, required this.mission});
  final Mission mission;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 600,
        width: 390,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Name:',
                style: TextStyle(
                    color: Color(0xFF81657C),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(height: 5),
              Text(
                mission.mission_name,
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),

              SizedBox(height: 20),
              Text(
                'Id:',
                style: TextStyle(
                    color: Color(0xFF81657C),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(height: 5),
              Text(
                mission.mission_id,
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),

              SizedBox(height: 20),
              Text(
                'Description:',
                style: TextStyle(
                    color: Color(0xFF81657C),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(height: 5),
              Text(
                mission.description,
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
