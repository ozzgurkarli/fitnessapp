import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/presentation/sign/resetpassword.dart';
import 'package:fitnessapp/presentation/sign/signin.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputMail extends Cubit<Widget> {
  CubitInputMail() : super(const Loading());

  void isMailValid(String controller) {
    if (controller.split('@').length > 1 &&
        controller.split(".com").length > 1) {
      SignUp.mailValid = true;
      SignIn.mailValid = true;
      ResetPassword.mailValid = true;
      emit(const Check());
      return;
    }

    SignUp.mailValid = false;
    SignIn.mailValid = false;
    ResetPassword.mailValid = false;
    emit(const Loading());
  }
}
