import 'package:mvvm_pattren/data/network/BaseApiServices.dart';
import 'package:mvvm_pattren/data/network/NetworkApiServices.dart';
import 'package:mvvm_pattren/utils/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> logInApi(dynamic data) async {
    try {
      dynamic response = _apiServices.getPostApiResponse(AppUrl.logInUrl, data);
      return response;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          _apiServices.getPostApiResponse(AppUrl.registrationUrl, data);
      return response;
    } catch (error) {
      throw error;
    }
  }
}
