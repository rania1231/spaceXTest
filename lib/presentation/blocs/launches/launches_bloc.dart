import '../../../core/errors/failures.dart';
import '../../../domain/entities/launch/launch.dart';
import '../../../domain/use_cases/getAllLaunches.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'launches_event.dart';

part 'launches_state.dart';


class LaunchesBloc extends Bloc<LaunchesEvent, LaunchesState> {
  final GetAllLaunchesUseCase getAllLaunches;
  LaunchesBloc({required this.getAllLaunches}) : super(LaunchesInitial()) {
    on<LaunchesEvent>((event,emit)async{
      if(event is GetAllLaunchesEvent){
        emit(LoadingLaunchesState());
        final posts=await getAllLaunches.call();
        posts.fold(
                (failure) {
              emit(ErrorLaunchesState(message: _mapFailureToString(failure))) ;
            }
            ,
                (launches) {
                emit(LoadedLaunchesState(launches:launches )) ;
            });
      }
      else {

      }
    });

  }


  String _mapFailureToString(Failure failure){

    switch(failure.runtimeType){
      case ServerFailure:
        return"error server";
      case OffLineFailure:
        return"no internet connection";
      case EmptyCacheFailure:
        return"no data in the cache";
      default:
        return "Unexpected error ,please try again";

    }
  }
}
