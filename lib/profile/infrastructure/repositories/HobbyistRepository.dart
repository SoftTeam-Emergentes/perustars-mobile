import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/common/exceptions/exceptions.dart';
import 'package:peru_stars_mobile/common/utils/http_status.dart';
import 'package:peru_stars_mobile/profile/domain/interfaces/HobbyistInterface.dart';
import 'package:peru_stars_mobile/profile/infrastructure/data_source/hobbyist_remote_data_provider.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/hobbyist_model.dart';

class HobbyistRepository implements HobbyistInterface{
  late final HobbyistDataProvider _hobbyistDataProvider;
  HobbyistRepository(){
    _hobbyistDataProvider=HobbyistDataProvider();
  }

  @override
  Future createHobbyist(int userId, int age) async{
    try {
      HobbyistModel model=HobbyistModel(id:0, userId: userId, age: age);
      Response response=await _hobbyistDataProvider.createHobbyist(model);
      return response;
    }catch(e) {
      throw ServerException("Something went wronf while creating hobbyist", HttpStatus.fromStatusCode(500));
    }
  }

  @override
  Future deleteHobbyistById(int id) async{
    Response response= await _hobbyistDataProvider.deleteHobbyistById(id);
    return response;
  }

  @override
  Future editHobbyistId(int id) {
    throw UnimplementedError();
  }

  @override
  Future<HobbyistModel> getHobbyistById(int id) async{
    Response response= await _hobbyistDataProvider.getHobbyistById(id);
    dynamic respApi=json.decode(response.data);
    HobbyistModel hobbyistModel=HobbyistModel.fromJson(respApi);
    return hobbyistModel;
  }
  
  @override
  Future<Response> getHobbyistByUserId(int userId) async {
    Response response = await _hobbyistDataProvider.getHobbyistByUserId(userId);
    return response;
  }


}