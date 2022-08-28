import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_pattren/res/components/round_button.dart';
import 'package:mvvm_pattren/utils/routes/routes.dart';
import 'package:mvvm_pattren/utils/utils.dart';
import 'package:mvvm_pattren/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _obsecurPassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "MVVM",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              obscureText: false,
              focusNode: emailFocusNode,
              obscuringCharacter: "*",
              onFieldSubmitted: (value) {
                Utils.fieldFocusNode(
                    context: context,
                    current: emailFocusNode,
                    nextFocus: passwordFocusNode);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "Email",
                labelText: "Email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurPassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: _obsecurPassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        hintText: "password",
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obsecurPassword.value = !_obsecurPassword.value;
                          },
                          child: _obsecurPassword.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        )),
                  );
                }),
            SizedBox(
              height: height * 0.09,
            ),
            RoundButton(
              title: "LogIn",
              loading: authViewModel.loading,
              onPress: () {
                if (emailController.text.isEmpty &&
                    passwordController.text.isEmpty) {
                  Utils.flutterToast(
                      context: context,
                      message: "Both field are empty please fill");
                } else if (emailController.text.isEmpty) {
                  Utils.flutterToast(
                      context: context, message: "email is empty");
                } else if (passwordController.text.isEmpty) {
                  Utils.flutterToast(
                      context: context, message: "password is empty");
                } else if (passwordController.text.length < 6) {
                  Utils.flutterToast(
                      context: context, message: "password required 6 digit");
                } else {
                  if (kDebugMode) {
                    // print("API HIT");
                  }
                  Map data = {
                    'email': emailController.text.toString(),
                    'password': emailController.text.toString(),
                  };
                  authViewModel.logInApi(context: context, data: data);
                  if (kDebugMode) {
                    // print("API HIT");
                  }
                }
              },
              // loading: false,
            )
          ],
        ),
      ),
    );
  }
}
