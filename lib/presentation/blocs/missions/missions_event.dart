part of 'missions_bloc.dart';





abstract class MissionsEvent extends Equatable {
  const MissionsEvent();

  @override
  List<Object> get props => [];
}
class GetAllMissionsEvent extends MissionsEvent{}
class RefreshMissionsEvent extends MissionsEvent{}