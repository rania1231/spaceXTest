
import 'dart:convert';

import 'package:spacex_test/data/models/LaunchModel.dart';
import 'package:http/http.dart'as http;

abstract class LaunchRemoteDataSource{
  Future<List<LaunchModel>>getAllLaunches();

}


class LaunchRemoteDataSourceImpl implements LaunchRemoteDataSource{
  final http.Client client;
  final linkBase="https://api.spacexdata.com/v3";
  LaunchRemoteDataSourceImpl({required this.client});


  @override
  Future<List<LaunchModel>> getAllLaunches()async {
  final response=await client.get(Uri.parse(linkBase+'/lanches'));
  if(response.statusCode==200){
    List<Map<String,dynamic>>dataJson=json.decode(response.body) ;
    List<LaunchModel>data= dataJson.map((elt) => LaunchModel.fromJson(elt)).toList();
    return data;
  }else{
    throw Exception();
  }

  }



}