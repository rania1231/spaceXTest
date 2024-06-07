import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_test/data/models/MissionModel.dart';

import '../../../core/errors/exceptions.dart';

abstract class MissionLoacalDataSource {
  Future<List<MissionModel>>getAllMissions();
  Future<MissionModel>getOneMission(int id);
  Future<Unit>saveMissions(List<MissionModel> missionModels);
}


class MissionLocalDataSourceimpl implements MissionLoacalDataSource {
  final SharedPreferences sharedPreferences;

  MissionLocalDataSourceimpl({required this.sharedPreferences});

  @override
  Future<List<MissionModel>> getAllMissions() async {
    final dataString = sharedPreferences.getString("CACHED-MISSIONS");
    if (dataString != null) {
      List<Map<String, dynamic>> dataMap = json.decode(dataString);
      List<MissionModel> data = dataMap
          .map((missionModelMap) => MissionModel.fromJson(missionModelMap))
          .toList();
      return Future.value(data);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> saveMissions(List<MissionModel> missionModels) {
    List missionModelJson = missionModels
        .map<Map<String, dynamic>>((missionModel) => missionModel.toJson())
        .toList();
    sharedPreferences.setString(
        "CACHED-MISSIONS", json.encode(missionModelJson));
    return Future.value(unit);
  }

  @override
  Future<MissionModel> getOneMission(int id) async {
    List<MissionModel>? missions = await getAllMissions();
    if(missions!=null){
      for (MissionModel model in missions) {
        if (model.mission_id == id)   return Future.value(model);

      }
      throw NoObjectFoundException();
    }else {
      throw EmptyCacheException();
    }
  }
}
