import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/Settings/model/user_profile_model.dart';
import 'package:travel_aliga/app/utils/api_helper/dio_intercepter.dart';
import 'package:travel_aliga/app/utils/api_helper/internet_cheker.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class ApiSettings {
  Future<UserProfile?> fetch() async {
    bool connectivity = await HelperInternetChecker.checkConnectivity();
    if (!connectivity) {
      return null;
    }
    Dio dio = await HelperIntercepter().getApiClient();
    try {
      final response = await dio.get("${Url.baseUrl}${Url.userProfile}");
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {

        return UserProfile.fromJson(response.data);
      } else {
        return UserProfile(message: "Something went wrong");
      }
    } on DioError catch (e) {
      print('*********dio error from service********');
      return UserProfile.fromJson(e.response!.data);
    } catch (e) {
      print('*********catch error from service********');
      return UserProfile(message: e.toString());
    }
  }
}
