part of 'launches_bloc.dart';

abstract class LaunchesState extends Equatable {
  const LaunchesState();

  @override
  List<Object> get props => [];
}
class LaunchesInitial  extends LaunchesState{}

class LoadingLaunchesState extends LaunchesState{}

class LoadedLaunchesState extends LaunchesState{
  final List<Launch>launches;
  LoadedLaunchesState({required this.launches}){}
  @override
  List<Object> get props => [launches];
}

class ErrorLaunchesState extends LaunchesState{
  final String message;
  ErrorLaunchesState({required this.message}){}
  @override
  List<Object> get props => [message];
}