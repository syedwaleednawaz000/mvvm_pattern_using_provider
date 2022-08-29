import 'package:flutter/material.dart';
import 'package:mvvm_pattren/res/colors/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  RoundButton(
      {required this.title, this.loading = false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading ? CircularProgressIndicator():Text(title,style: TextStyle(color: AppColors.whiteColor),),
        ),
      ),
    );
  }
}
