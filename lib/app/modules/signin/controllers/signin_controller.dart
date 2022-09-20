import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_aliga/app/modules/signin/model/signin_model.dart';
import 'package:travel_aliga/app/modules/signin/model/token_model.dart';
import 'package:travel_aliga/app/modules/signin/service/api_service.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class SigninController extends GetxController {
  final signUpKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  Future<void> onSubmit(BuildContext ctx) async {
    isLoading.value =true;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (password.isEmpty || email.isEmpty) {
      ErrorDialoge.showSnakBar('All fields are Requires');
      isLoading.value = false;
      return;
    }
    final obj = SignInModel(email: email, password: password);
    final response = await Api().getUser(obj);
    isLoading.value = false;
    if(response != null){
      if(response.token != null){
        addToSecureStorage(response);
        setLogined();
        log(response.toJson().toString());
        Get.offAllNamed(Paths.mainScreen);
      }else{
        ErrorDialoge.showSnakBar(response.message.toString());
      }

    }else{
      ErrorDialoge.showSnakBar("No network");
    }
  }

  bool secure = true;
  changeVisibility() {
    secure = !secure;
    update();
  }

  Future<void> addToSecureStorage(TokenModel value)async{
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    AndroidOptions secureOptions = AndroidOptions(encryptedSharedPreferences:true );
    await secureStorage.write(key: "Token", value: value.token,aOptions: secureOptions);
    await secureStorage.write(key: "refreshToken", value: value.refresh,aOptions: secureOptions);
  }

  Future<String> getToken()async{
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    return await secureStorage.read(key: "Token")??"";
  }
    Future<String> getRefreshToken()async{
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    return await secureStorage.read(key: "refreshToken")??"";
  }

  setLogined()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    pref.setBool("isLogined", true);
  }
  Future<bool> getLogined()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    return pref.getBool("isLogined")?? false;
  }
}
/*

class SigninController extends GetxController {
  final signUpKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  Future<void> onSubmit(BuildContext ctx) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (password.isEmpty || email.isEmpty) {
      showSnakBar('All fields are Requires');
      return;
    }
    final obj = SignInModel(email: email, password: password);
    final dio = Dio(
      BaseOptions(
        baseUrl: Url.baseUrl,
      ),
    );
    try {
      final result = await dio.post(Url.login, data: obj.toJson());
      if (result.statusCode! >= 200 && result.statusCode! <= 299) {
        print(result.data);
        final value = TokenModel.fromJson(result.data);
        print(value.token);
        Get.off(() => HomeView());
      }else{
        showSnakBar('Client Faliure');
      }
    }on DioError catch(e) {
     ErrorDialoge. errorDialog(ctx,e.response!.statusMessage.toString() ,statusCode:  e.response!.statusCode.toString());
    } 
    catch (e) {
      showSnakBar('Server Faliure Unable to connect');
      log(e.toString());
    }
  }

  bool secure = true;
  changeVisibility() {
    secure = !secure;
    update();
  }


 static showSnakBar(String message) {
    Get.snackbar(
      "Error",
      '',
      snackPosition: SnackPosition.BOTTOM,
      icon:Icon(Icons.warning_amber_outlined,color: Colors.yellow,) ,
      messageText: Text(message,style: AppStyle.kCardTextStyle.copyWith(fontSize: 14),),
      backgroundColor: Colors.red,
      borderRadius: 10,
      margin: EdgeInsets.all( 10),
      colorText: Colors.white,
    );
  }
}

*/
