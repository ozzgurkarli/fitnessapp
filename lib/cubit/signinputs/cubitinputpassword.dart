import 'package:fitnessapp/Widgets/assets.dart';
import 'package:fitnessapp/presentation/sign/signin.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputPassword extends Cubit<Widget> {
  CubitInputPassword() : super(const Loading());

  bool isPasswordValid(String? controller) {
    if (controller != null && controller.length == 6) {
      try {
        int.parse(controller);

        SignUp.passwordValid = true;
        SignIn.passwordValid = true;
        emit(const Check());
        return true;
      } catch (e) {
        SignUp.passwordValid = false;
        SignIn.passwordValid = false;
        emit(const Loading());
        return false;
      }
    }

    SignUp.passwordValid = false;
    SignIn.passwordValid = false;
    emit(const Loading());
    return false;
  }
}
