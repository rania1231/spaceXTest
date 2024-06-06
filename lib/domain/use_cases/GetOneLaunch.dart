import 'package:dartz/dartz.dart';
import 'package:spacex_test/domain/entities/launch/launch.dart';
import 'package:spacex_test/domain/repository/launch_repository.dart';

import '../../core/errors/failures.dart';

class GetOneLaunch{
  final LaunchRepository launchRepository;
  GetOneLaunch({required this.launchRepository}){}

  Future<Either<Failure,Launch>>call(String id){
    return launchRepository.getOneLaunch(id);
  }
}