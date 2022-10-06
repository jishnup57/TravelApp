
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_aliga/app/modules/Settings/model/user_profile_model.dart';
import 'package:travel_aliga/app/modules/Settings/services/api_service.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';


class SettingsController extends GetxController{

    @override
  void onInit() {
    super.onInit();
     getUserProfile();
  }

  static FlutterSecureStorage st = FlutterSecureStorage();
 
  UserProfile? userDetails;
 
  getUserProfile() async {

    final result = await ApiSettings().fetch();
    if(result != null){
      if(result.firstName != null){
       userDetails = result;
      addToSecureStorage();
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
   
    await sp.remove("isLogined");
    await st.delete(key: "Token");
    await st.delete(key: "refreshToken");
   
    sp.clear();
    st.deleteAll();
    Get.offAllNamed(Paths.splash);
  }
  addToSecureStorage()async{
     FlutterSecureStorage st = FlutterSecureStorage();
      await st.write(key: "phone", value: userDetails!.phone);
      await st.write(key:"email",value: userDetails!.email);
  }


  
}
