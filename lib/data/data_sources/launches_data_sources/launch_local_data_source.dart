import 'package:dartz/dartz.dart';
import 'package:spacex_test/data/models/LaunchModel.dart';

abstract class LaunchLocalDataSource {
  Future<List<LaunchModel>>getAllLaunches();
  Future<LaunchModel>getOneLaunch();
  Future<Unit>saveLaunches();
}