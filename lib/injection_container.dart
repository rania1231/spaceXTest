import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex_test/data/data_sources/launches_data_sources/launch_remote_data_source.dart';
import 'package:spacex_test/data/data_sources/mission_data_sources/mission_remote_data_source.dart';
import 'package:spacex_test/data/repositories/launch_model_repository_impl.dart';
import 'package:spacex_test/domain/repository/mission_repository.dart';
import 'package:spacex_test/domain/use_cases/getAllLaunches.dart';
import 'package:spacex_test/domain/use_cases/getAllMissions.dart';
import 'package:spacex_test/presentation/blocs/launches/launches_bloc.dart';
import 'package:http/http.dart'as http;
import 'package:spacex_test/presentation/blocs/missions/missions_bloc.dart';
import 'core/network/network_info.dart';
import 'data/data_sources/launches_data_sources/launch_local_data_source.dart';
import 'data/data_sources/mission_data_sources/mission_local_data_source.dart';
import 'data/repositories/mission_model_repository_impl.dart';
import 'domain/repository/launch_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {


  sl.registerFactory(() => LaunchesBloc(getAllLaunches: sl()));




  // Usecases

  sl.registerLazySingleton(() => GetAllLaunchesUseCase( launchRepository: sl(),));
  // Repository

  sl.registerLazySingleton<LaunchRepository>(() => LaunchModelRepositoryImpl(
      launchRemoteDataSource: sl(), launchLocalDataSource: sl(), networkInfo: sl()));
//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl( internetConnectionChecker: sl(),));

  // Datasources

  sl.registerLazySingleton<LaunchRemoteDataSource>(
          () => LaunchRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LaunchLocalDataSource>(
          () => LaunchLocalDataSourceimpl(sharedPreferences: sl()));


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());






  sl.registerFactory(() => MissionsBloc(getAllMissions: sl()));
  // Usecases

  sl.registerLazySingleton(() => GetAllMissionsUseCase( missionRepository: sl(),));


  // Repository

  sl.registerLazySingleton<MissionRepository>(() => MissionModelRepositoryImpl(
      missionRemoteDataSource: sl(), missionLocalDataSource: sl(), networkInfo: sl()));

  // Datasources

  sl.registerLazySingleton<MissionRemoteDataSource>(
          () => MissionRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<MissionLocalDataSource>(
          () => MissionLocalDataSourceimpl(sharedPreferences: sl()));


}