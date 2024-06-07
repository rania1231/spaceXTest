part of 'missions_bloc.dart';

abstract class MissionsState extends Equatable {
  const MissionsState();

  @override
  List<Object> get props => [];
}
class MissionsInitial  extends MissionsState{}

class LoadingMissionsState extends MissionsState{}

class LoadedMissionsState extends MissionsState{
  final List<Mission>missions;
  LoadedMissionsState({required this.missions}){}
  @override
  List<Object> get props => [missions];
}

class ErrorMissionsState extends MissionsState{
  final String message;
  ErrorMissionsState({required this.message}){}
  @override
  List<Object> get props => [message];
}