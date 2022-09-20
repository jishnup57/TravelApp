

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_aliga/app/modules/otp/model/model_otp.dart';
import 'package:travel_aliga/app/modules/otp/model/response_otp.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class OtpController extends GetxController {
 String? phoneNum;
 bool isLoading=false;

  final phone = Get.arguments.toString();





otpSubmit(String verificationCode)async{
  isLoading=true;
   final obj =OtpModel(code:verificationCode , phone:phone);
   try {
    final dio=Dio(BaseOptions(baseUrl: Url.baseUrl));
    final response=await dio.post(Url.verify,data: obj.toJson());
    if(response.statusCode==200||response.statusCode==201){
    log(response.data.toString());
    OtpResponse otpResponse= OtpResponse.fromJson(response.data);
    saveToSharedpref(otpResponse);
    Get.offAllNamed(Paths.home);
    }else{
      if(response.statusCode==400){
        removeLoading();
        ErrorDialoge.showSnakBar(response.data['detail']);
      }
      removeLoading();
      ErrorDialoge.showSnakBar(response.data.toString());
    }
   }on DioError catch(e){
    removeLoading();
    if (e.response!.statusCode==400) {
    ErrorDialoge.showSnakBar(e.response!.data['detail']);
      
    }
    log(e.toString());
   }
    catch (e) {
    removeLoading();
     print(e);
   }
  Get.back();

}

saveToSharedpref(OtpResponse value)async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UserPhoneNumber', value.phone);
    prefs.setString('UserName', '${value.firstname} ${value.lastname}');
    prefs.setString('UserEmail', value.email);
}

removeLoading(){
  if (isLoading==true) {
    Get.back();
    isLoading=false;
  }
}

}
