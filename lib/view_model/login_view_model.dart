import 'package:flutter/cupertino.dart';
import 'package:mvvm_pattren/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInViewModel with ChangeNotifier {
  Future<bool> saveUserData(LogInModel user) async {
    print("user token ${user.token.toString()}");
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    print(sp.get("token").toString());
    notifyListeners();
    return true;
  }

  Future<LogInModel> getUserData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token").toString();
    return LogInModel(token: token.toString());
  }
  Future<bool> removerUserData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return  sp.clear();
  }
}
