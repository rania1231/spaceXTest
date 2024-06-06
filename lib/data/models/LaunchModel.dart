import '../../domain/entities/launch/launch.dart';

class LaunchModel extends Launch {
  LaunchModel(
      {required String id,
      required String name,
      required String details,
      required DateTime date_local})
      : super(id: id, details: details, date_local: date_local, name: name);

  factory LaunchModel.fromJson(Map<String, dynamic> launchMap) {
    return LaunchModel(
        id: launchMap['id'],
        name: launchMap['name'],
        details: launchMap['details'],
        date_local: launchMap['date_local']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'details': this.details,
      'name': this.name,
      'date_local': this.date_local
    };
  }
}
