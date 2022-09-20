import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/signup/model/signup_model.dart';
import 'package:travel_aliga/app/utils/api_helper/internet_cheker.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class ApiSignUp{
  Dio dio = Dio(
    BaseOptions(baseUrl: Url.baseUrl),
  );
  Future<SignUpModel?> registerUser(SignUpModel obj)async{
      bool connectivity = await HelperInternetChecker.checkConnectivity();
      if(!connectivity){
        return null;
      }

      try{
        final response = await dio.post(Url.signup,data: obj.toJson());
        if (response.statusCode! >=200 && response.statusCode! <=299) {
          return SignUpModel.fromJson(response.data);
        } else {
          return SignUpModel(message: 'Some unknown error occured');
        }
      }on DioError catch(e){
        log('dioerror');
        if(e.response!.data == null){
          return SignUpModel(message:'Something went wrong!' );
        }
        log(e.response!.data.toString());
        return SignUpModel(message: e.response!.data["detail"]);
      }
       catch(e){
          log('catch');
      return SignUpModel(message:e.toString());
      }
      
  }
}