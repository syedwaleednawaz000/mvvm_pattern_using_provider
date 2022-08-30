import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_pattren/model/login_model.dart';
import 'package:mvvm_pattren/repository/auth_repository.dart';
import 'package:mvvm_pattren/utils/routes/routes_name.dart';
import 'package:mvvm_pattren/utils/utils.dart';
import 'package:mvvm_pattren/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  /// for login
  bool _logInLoading = false;

  bool get logInLoading => _logInLoading;

  setLogInLoading(bool value) {
    _logInLoading = value;
    notifyListeners();
  }

  Future<void> logInApi({dynamic data, required BuildContext context}) async {
    setLogInLoading(true);
    _myRepo.logInApi(data).then((value) {
      setLogInLoading(false);
      final userPreference = Provider.of<LogInViewModel>(context,listen: false);
      userPreference.saveUserData(
        LogInModel(token: value['token'].toString()),
      );
      Utils.flutterToast(context: context, message: "LogIn Succesfully");
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
        print("API hit");
      }
    }).onError((error, stackTrace) {
      setLogInLoading(false);
      Utils.flutterToast(context: context, message: error.toString());
      if (kDebugMode) {
        print(error);
      }
    });
  }

//Todo: for signup
  bool _signUploading = false;

  bool get signUploading => _signUploading;

  setSignUpLoading(bool value) {
    _signUploading = value;
    notifyListeners();
  }

  Future<void> signUpApi({dynamic data, required BuildContext context}) async {
    setSignUpLoading(true);
    _myRepo.logInApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flutterToast(context: context, message: "SignUp Successfully!!!");
      Navigator.pushNamed(context, RoutesName.login);
      if (kDebugMode) {
        print(value.toString());
        print("API hit");
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flutterToast(context: context, message: error.toString());
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
