import 'package:dartz/dartz.dart';

import 'package:spacex_test/core/errors/failures.dart';

import 'package:spacex_test/domain/entities/launch/launch.dart';

import '../../core/errors/exceptions.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/mission/mission.dart';
import '../../domain/repository/launch_repository.dart';
import '../../domain/repository/mission_repository.dart';
import '../data_sources/launches_data_sources/launch_local_data_source.dart';
import '../data_sources/launches_data_sources/launch_remote_data_source.dart';
import '../data_sources/mission_data_sources/mission_local_data_source.dart';
import '../data_sources/mission_data_sources/mission_remote_data_source.dart';

class MissionModelRepositoryImpl implements MissionRepository {
  final MissionRemoteDataSource missionRemoteDataSource;
  final MissionLocalDataSource missionLocalDataSource;
  final NetworkInfo networkInfo;

  MissionModelRepositoryImpl(this.networkInfo,
      {required this.missionRemoteDataSource, required this.missionLocalDataSource}){}

  @override
  Future<Either<Failure, List<Mission>>> getAllMissions()async {

    if (await networkInfo.isConnected) {
      try {
        final remoteMissions = await missionRemoteDataSource.getAllMissions();
        missionLocalDataSource.saveMissions(remoteMissions);
        return Right(remoteMissions);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMissions = await missionLocalDataSource.getAllMissions();
        return Right(localMissions);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Mission>> getOneMission(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMission = await missionRemoteDataSource.getOneMission(id);

        return Right(remoteMission);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localMission = await missionLocalDataSource.getOneMission(id);
        return Right(localMission);
      } on EmptyCacheException {
        return Left(NoObjectFoundFailure());
      }
    }
  }


}

