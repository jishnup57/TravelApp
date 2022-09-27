
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_aliga/app/modules/Settings/model/user_profile_model.dart';
import 'package:travel_aliga/app/modules/Settings/services/api_service.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';


class SettingsController extends GetxController{


  SettingsController() {
    getUserProfile();
  }

  static bool profileLoaded = false;
  UserProfile? userDetails;

  getUserProfile() async {
    if(profileLoaded){
      return;
    }
    final result = await ApiSettings().fetch();
    if(result != null){
      if(result.firstName != null){
       userDetails = result;
        update();
      }else{
        ErrorDialoge.showSnakBar(result.message!);
      }
    }else{
      ErrorDialoge.showSnakBar("No network");
    }
  }
  static userLogout()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    FlutterSecureStorage st = FlutterSecureStorage();
    await sp.remove("isLogined");
    await st.delete(key: "Token");
    await st.delete(key: "refreshToken");
    profileLoaded = false;
    Get.offAllNamed(Paths.splash);
  }
}
