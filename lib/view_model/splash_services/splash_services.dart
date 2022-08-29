import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattren/model/login_model.dart';
import 'package:mvvm_pattren/utils/routes/routes_name.dart';
import 'package:mvvm_pattren/view_model/login_view_model.dart';

class SplashServices {
  Future<LogInModel> getUserData() => LogInViewModel().getUserData();

  void checkAuth(BuildContext context) async {
    getUserData().then((value)  {
          print("value of token ${value.token.toString()}");
          if (value.token == "null" || value.token.isEmpty || value.token == "")
            {
              Navigator.pushNamed(context, RoutesName.login);
            }
          else
            {
              Navigator.pushNamed(context, RoutesName.home);
            }
        }).onError((error, stackTrace) {
          if (kDebugMode) {
            print("$error");
          }
    });
  }
}
