import 'package:flutter/material.dart';

class AdminController extends ChangeNotifier {
  bool obscureText = true;
  FocusNode passwordFocus = FocusNode();
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void changeObscure() {
    obscureText = !obscureText;
    if (obscureText) {
      passwordFocus.unfocus();
    } else {
      passwordFocus.requestFocus();
    }
    notifyListeners();
  }
}
