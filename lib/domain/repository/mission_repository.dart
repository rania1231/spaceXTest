import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_test/core/errors/failures.dart';
import 'package:spacex_test/domain/entities/mission/mission.dart';

abstract class MissionRepository extends Equatable{
  Future<Either<Failure,List<Mission>>>getAllMissions();
  Future<Either<Failure,Mission>>getOneMission(String id);
}