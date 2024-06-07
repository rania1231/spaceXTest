import 'package:flutter/material.dart';
import 'package:spacex_test/presentation/widgets/missions/mission_detail_widget.dart';

import '../../domain/entities/mission/mission.dart';


class MissionDetailsPage extends StatelessWidget {
  const MissionDetailsPage({super.key, required this.mission});
  final Mission mission;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text('Mission ${mission.mission_name}')),
        body:MissionDetailsWidget(mission: mission,)
    );
  }
}
