import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_test/presentation/blocs/launches/launches_bloc.dart';
import 'package:spacex_test/presentation/blocs/missions/missions_bloc.dart';
import 'package:spacex_test/presentation/pages/Home_page.dart';
import 'injection_container.dart' as di;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(
        create: (_) => di.sl<LaunchesBloc>()..add(GetAllLaunchesEvent())),
          BlocProvider(
              create: (_) => di.sl<MissionsBloc>()..add(GetAllMissionsEvent())),

    ],
    child:MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    ));
  }
}


