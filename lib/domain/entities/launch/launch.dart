import 'package:equatable/equatable.dart';

class Launch extends Equatable {
  final String id;
  final String name;
  final String details;
  final DateTime date_local;

  Launch(
      {required this.id, required this.name, required this.details, required this.date_local}){}

  @override
  // TODO: implement props
  List<Object?> get props => [id,name, details,date_local];

}