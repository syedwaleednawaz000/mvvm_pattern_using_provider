import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils{


  static void fieldFocusNode({ required BuildContext context, required FocusNode current,required FocusNode nextFocus}){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
    static  flutterToast({required BuildContext context,required String message}){
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          // gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


    // static flushBar({required BuildContext context,required String message}){
    //   Flushbar(
    //     message: message,
    //     icon: Icon(
    //       Icons.info_outline,
    //       // size: 28.0,
    //       color: Colors.blue[300],
    //     ),
    //     duration: const Duration(seconds: 3),
    //     leftBarIndicatorColor: Colors.blue[300],
    //   ).show(context);
    // }
    static snackBar(){
      Get.snackbar("error", "something else",
      backgroundColor: Colors.black,
      snackStyle: SnackStyle.FLOATING,
      duration: Duration(seconds: 1),
      titleText: Row(children: const [
        Icon(Icons.error,color: Colors.white,),
        Text("waleed",style: TextStyle(color: Colors.white),),
        Text("waleed",style: TextStyle(color: Colors.white),),
      ],));
    }
}