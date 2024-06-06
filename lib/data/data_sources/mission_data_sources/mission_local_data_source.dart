import 'package:dartz/dartz.dart';
import 'package:spacex_test/data/models/MissionModel.dart';

abstract class MissionLoacalDataSource {
  Future<List<MissionModel>>getAllMissions();
  Future<MissionModel>getOneMission();
  Future<Unit>saveMissions();
}