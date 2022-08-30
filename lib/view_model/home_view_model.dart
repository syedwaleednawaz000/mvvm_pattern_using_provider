import 'package:flutter/material.dart';
import 'package:mvvm_pattren/data/response/api_response.dart';
import 'package:mvvm_pattren/repository/home_view_repository.dart';

import '../model/home_model.dart';
class HomeViewModel with ChangeNotifier{

  final _myRepo = HomeRepository();
  ApiResponse<HomeModel> moveilist = ApiResponse.loading();
  setMovieList(ApiResponse<HomeModel> response) {
    moveilist = response;
    notifyListeners();
  }
  Future<void> fetchMovieData()async{
    setMovieList(ApiResponse.loading());
    _myRepo.homeApi().then((value) {
      setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error(error));
    });
  }
}