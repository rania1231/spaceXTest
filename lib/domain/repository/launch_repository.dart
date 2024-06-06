import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/launch/launch.dart';

abstract class LaunchRepository {
  Future<Either<Failure,List<Launch>>>getAllLaunches();
}