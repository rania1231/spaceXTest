import 'package:dartz/dartz.dart';

import 'package:spacex_test/domain/repository/mission_repository.dart';

import '../../core/errors/failures.dart';
import '../entities/mission/mission.dart';

class GetOneMission{
  final MissionRepository missionRepository;
  GetOneMission({required this.missionRepository}){}

  Future<Either<Failure,Mission>>call(String id){
    return missionRepository.getOneMission(id);
  }
}