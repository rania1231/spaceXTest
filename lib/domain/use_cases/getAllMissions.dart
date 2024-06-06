import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:spacex_test/core/errors/failures.dart';
import 'package:spacex_test/domain/repository/mission_repository.dart';

import '../entities/mission/mission.dart';

class GetAllMissionsUseCase{
 final MissionRepository missionRepository;
 GetAllMissionsUseCase({required this.missionRepository}){}

  Future<Either<Failure,List<Mission>>>call(){
   return missionRepository.getAllMissions();
  }

}