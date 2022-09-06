
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
 var isLoading=false.obs;



  @override
  void onInit() {
    super.onInit();
    getPhoneNumber();
  }

  getPhoneNumber()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   phoneNum= prefs.getString('UserPhoneNumber');
   print(phoneNum);
   update();

}

otpSubmit(String verificationCode)async{
  isLoading.value==true;
   final obj =OtpModel(code:verificationCode , phone: phoneNum.toString());
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
        ErrorDialoge.showSnakBar(response.data['detail']);
      }
      ErrorDialoge.showSnakBar(response.data.toString());
    }
   }on DioError catch(e){
    if (e.response!.statusCode==400) {
    ErrorDialoge.showSnakBar(e.response!.data['detail']);
      
    }
    log(e.toString());
   }
    catch (e) {
     print(e);
   }
   isLoading.value==false;
}

saveToSharedpref(OtpResponse value)async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('UserPhoneNumber', value.phone);
   await prefs.setString('UserName', '${value.firstname} ${value.lastname}');
   await prefs.setString('UserEmail', value.email);
   print(prefs.getString('UserName'));
}

}
