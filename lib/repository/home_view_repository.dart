import 'package:mvvm_pattren/view_model/home_view_model.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../model/home_model.dart';
import '../utils/app_url.dart';

class HomeRepository{
  BaseApiServices _apiServices = NetworkApiService();

  Future<HomeModel> homeApi() async {
    try {
      dynamic response = _apiServices.getGetApiResponse(AppUrl.homeViewModelUrl);
      return response = HomeModel.fromJson(response);
    } catch (error) {
      throw error;
    }
  }
}