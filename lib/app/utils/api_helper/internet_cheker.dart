import 'package:internet_connection_checker/internet_connection_checker.dart';

class HelperInternetChecker{
 static Future<bool> checkConnectivity()async{
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }
}