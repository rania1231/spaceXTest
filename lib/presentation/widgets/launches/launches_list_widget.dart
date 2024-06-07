import 'package:flutter/material.dart';

import '../../../domain/entities/launch/launch.dart';
import '../../pages/launch_detail_page.dart';

class LaunchesListWidget extends StatelessWidget {
  const LaunchesListWidget({super.key, required this.launches});
  final List<Launch> launches;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:launches.length ,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(launches[index].name,style: TextStyle(fontWeight: FontWeight.bold),),
            trailing: Text(launches[index].date_local.toString()),
            onTap: (){Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LaunchDetailsPage(
                      launch: launches[index],
                    )));}//Navigator.push(context, route),
        );
      },

    );
  }
}
