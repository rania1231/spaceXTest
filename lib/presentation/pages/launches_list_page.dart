import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_test/presentation/widgets/launches/launches_list_widget.dart';

import '../../domain/entities/launch/launch.dart';
import '../blocs/launches/launches_bloc.dart';

class LaunchesListPage extends StatefulWidget {
  const LaunchesListPage({super.key});


  @override
  State<LaunchesListPage> createState() => _LaunchesListPageState();
}

class _LaunchesListPageState extends State<LaunchesListPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Launches'),),
      body:BlocBuilder<LaunchesBloc, LaunchesState>
          (builder: (context, state)
        {
          if (state is LoadingLaunchesState){
            return Center(child:CircularProgressIndicator());
          }else if (state is LoadedLaunchesState){
            return LaunchesListWidget(launches: state.launches);
          }else if (state is ErrorLaunchesState) {
            return Text('Error during the loading process');
          }else return Center(child:CircularProgressIndicator());
        }
        ),


    ) ;
  }
}
