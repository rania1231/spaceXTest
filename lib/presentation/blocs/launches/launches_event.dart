part of 'launches_bloc.dart';



abstract class LaunchesEvent extends Equatable {
  const LaunchesEvent();

  @override
  List<Object> get props => [];
}
class GetAllLaunchesEvent extends LaunchesEvent{}
