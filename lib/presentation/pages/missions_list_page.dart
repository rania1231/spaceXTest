import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/mission/mission.dart';
import '../blocs/missions/missions_bloc.dart';
import '../widgets/missions/missions_list_widget.dart';


class MissionsListPage extends StatefulWidget {
  const MissionsListPage({super.key});


  @override
  State<MissionsListPage> createState() => _MissionsListPageState();
}

class _MissionsListPageState extends State<MissionsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Missions'),),
      body:BlocBuilder<MissionsBloc, MissionsState>
        (builder: (context, state)
      {
        if (state is LoadingMissionsState){
          return CircularProgressIndicator();
        }else if (state is LoadedMissionsState){
          return MissionsListWidget(missions: state.missions);
        }else if (state is ErrorMissionsState) {
          return Text('Error during the loading process');
        }
        else return CircularProgressIndicator();
      }
      ),


    ) ;
  }
}
