import 'package:flutter/material.dart';
import 'package:spacex_test/presentation/widgets/launches/launches_list_widget.dart';

import '../../domain/entities/launch/launch.dart';
import '../widgets/launches/launch_detail_widget.dart';
class LaunchDetailsPage extends StatelessWidget {
  const LaunchDetailsPage({super.key, required this.launch});
  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Launch ${launch.name}')),
      body:LaunchDetailsWidget(launch: launch,)
    );
  }
}
