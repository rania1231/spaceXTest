import 'package:dartz/dartz.dart';
import 'package:spacex_test/domain/entities/launch/launch.dart';
import 'package:spacex_test/domain/repository/launch_repository.dart';

import '../../core/errors/failures.dart';

class GetAllLaunchesUseCase{
  final LaunchRepository launchRepository;
  GetAllLaunchesUseCase({required this.launchRepository}){}

  Future<Either<Failure,List<Launch>>>call(){
    return launchRepository.getAllLaunches();
  }
}