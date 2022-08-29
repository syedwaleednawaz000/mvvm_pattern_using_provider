import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattren/utils/routes/routes_name.dart';
import 'package:mvvm_pattren/view/home_screen.dart';
import 'package:mvvm_pattren/view/singup_view.dart';
import 'package:mvvm_pattren/view/splash_view.dart';

import '../../view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRout(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LogInScreen());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Container(
              child: const Center(
                child: Text("no rout found"),
              ),
            ),
          );
        });
    }
  }
}
