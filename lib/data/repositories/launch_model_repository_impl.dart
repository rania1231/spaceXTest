import 'package:dartz/dartz.dart';

import 'package:spacex_test/core/errors/failures.dart';

import 'package:spacex_test/domain/entities/launch/launch.dart';

import '../../core/errors/exceptions.dart';
import '../../core/network/network_info.dart';
import '../../domain/repository/launch_repository.dart';
import '../data_sources/launches_data_sources/launch_local_data_source.dart';
import '../data_sources/launches_data_sources/launch_remote_data_source.dart';

class LaunchModelRepositoryImpl implements LaunchRepository {
  final LaunchRemoteDataSource launchRemoteDataSource;
  final LaunchLocalDataSource launchLocalDataSource;
  final NetworkInfo networkInfo;

  LaunchModelRepositoryImpl(
      {required this.launchLocalDataSource, required this.launchRemoteDataSource, required this.networkInfo}){}

  @override
  Future<Either<Failure, List<Launch>>> getAllLaunches()async {

      if (await networkInfo.isConnected) {
        try {
          final remoteLaunches = await launchRemoteDataSource.getAllLaunches();
          launchLocalDataSource.saveLaunches(remoteLaunches);
          return Right(remoteLaunches);
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        try {
          final localLaunches = await launchLocalDataSource.getAllLaunches();
          return Right(localLaunches);
        } on EmptyCacheException {
          return Left(EmptyCacheFailure());
        }
      }
    }



}

