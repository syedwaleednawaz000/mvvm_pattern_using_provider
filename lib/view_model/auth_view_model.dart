import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_pattren/repository/auth_repository.dart';
import 'package:mvvm_pattren/utils/routes/routes_name.dart';
import 'package:mvvm_pattren/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> logInApi({dynamic data, required BuildContext context}) async {
    setLoading(true);
    _myRepo.logInApi(data).then((value) {
      setLoading(false);
      Utils.flutterToast(context: context, message: "LogIn Succesfully");
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
        print("API hit");
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flutterToast(context: context, message: error.toString());
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
