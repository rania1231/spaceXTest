import 'package:equatable/equatable.dart';

class Mission extends Equatable{
  final String mission_name;
  final String mission_id;
  final String description;
  Mission({required this.mission_name, required this.mission_id, required this.description}){}
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}