
import 'dart:convert';

import 'package:spacex_test/data/models/LaunchModel.dart';
import 'package:http/http.dart'as http;
import 'package:spacex_test/data/models/MissionModel.dart';

abstract class MissionRemoteDataSource{
  Future<List<MissionModel>>getAllMissions();
  Future<MissionModel>getOneMission(String id);
}


class MissionRemoteDataSourceImpl implements MissionRemoteDataSource{
  final http.Client client;
  final linkBase="https://api.spacexdata.com/v3";
  MissionRemoteDataSourceImpl({required this.client});


  @override
  Future<List<MissionModel>> getAllMissions()async {
    final response=await client.get(Uri.parse(linkBase+'/missions'));
    if(response.statusCode==200){
      List<Map<String,dynamic>>dataJson=json.decode(response.body) ;
      List<MissionModel>data= dataJson.map((elt) => MissionModel.fromJson(elt)).toList();
      return data;
    }else{
      throw Exception();
    }

  }

  @override
  Future<MissionModel> getOneMission(String id)async {
    final response=await client.get(Uri.parse(linkBase+'/missions/$id'));
    if(response.statusCode==200){
      Map<String,dynamic> launchJson=json.decode(response.body);
      MissionModel missionModel=MissionModel.fromJson(launchJson);
      return missionModel;
    }
    else  throw Exception();
  }



}