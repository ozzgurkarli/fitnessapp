import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputName extends Cubit<Widget> {
  CubitInputName() : super(const Loading());

  void isNameValid(String controller) {
    if (controller.length > 1) {
      SignUp.nameValid = true;
      emit(const Check());
      return;
    }
    SignUp.nameValid = false;
    emit(const Loading());
  }
}
