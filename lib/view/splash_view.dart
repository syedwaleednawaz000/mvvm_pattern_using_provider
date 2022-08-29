import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattren/utils/routes/routes_name.dart';
import 'package:mvvm_pattren/view/login_screen.dart';
import 'package:mvvm_pattren/view_model/splash_services/splash_services.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  SplashServices _splashServices = SplashServices();
  void initState() {
    _splashServices.checkAuth(context);
    // Timer(const Duration(seconds: 5), (){
    //  Get.toNamed(RoutesName.login);
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Splash view",style: TextStyle(color:
            Colors.white),)
          ],
        ),
      ),
    );
  }
}
