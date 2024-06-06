import '../../domain/entities/launch/launch.dart';
import '../../domain/entities/mission/mission.dart';

class MissionModel extends Mission {
  MissionModel(
      {required String mission_id,
        required String mission_name,
        required String description})
      : super(mission_id: mission_id, mission_name: mission_name, description: description);

  factory MissionModel.fromJson(Map<String, dynamic> launchMap) {
    return MissionModel(
        mission_id: launchMap['mission_id'],
        mission_name: launchMap['mission_name'],
        description: launchMap['description'],
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'mission_id': this.mission_id,
      'mission_name': this.mission_name,
      'description': this.description,

    };
  }
}
