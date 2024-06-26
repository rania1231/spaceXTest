import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_test/data/models/LaunchModel.dart';

import '../../../core/errors/exceptions.dart';

abstract class LaunchLocalDataSource {
  Future<List<LaunchModel>> getAllLaunches();



  Future<Unit> saveLaunches(List<LaunchModel> launchModels);
}

class LaunchLocalDataSourceimpl implements LaunchLocalDataSource {
  final SharedPreferences sharedPreferences;

  LaunchLocalDataSourceimpl({required this.sharedPreferences});

  @override
  Future<List<LaunchModel>> getAllLaunches() async {
    final dataString = sharedPreferences.getString("CACHED-LAUNCHES");
    if (dataString != null) {
      List<Map<String, dynamic>> dataMap = json.decode(dataString);
      List<LaunchModel> data = dataMap
          .map((launchModelMap) => LaunchModel.fromJson(launchModelMap))
          .toList();
      return Future.value(data);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> saveLaunches(List<LaunchModel> launchModels) {
    List launchModelJson = launchModels
        .map<Map<String, dynamic>>((launchModel) => launchModel.toJson())
        .toList();
    sharedPreferences.setString(
        "CACHED-LAUNCHES", json.encode(launchModelJson));
    return Future.value(unit);
  }


}
