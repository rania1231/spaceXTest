import '../../../core/errors/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/mission/mission.dart';
import '../../../domain/use_cases/getAllMissions.dart';

part 'missions_event.dart';

part 'missions_state.dart';


class MissionsBloc extends Bloc<MissionsEvent, MissionsState> {
  final GetAllMissionsUseCase getAllMissions;
  MissionsBloc({required this.getAllMissions}) : super(MissionsInitial()) {
    on<MissionsEvent>((event,emit)async{
      if(event is GetAllMissionsEvent){
        emit(LoadingMissionsState());
        final posts=await getAllMissions.call();
        posts.fold(
                (failure) {
              emit(ErrorMissionsState(message: _mapFailureToString(failure))) ;
            }
            ,
                (missions) {
              emit(LoadedMissionsState(missions:missions )) ;
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
