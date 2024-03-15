import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputSurname extends Cubit<Widget> {
  CubitInputSurname() : super(const Loading());

  void isSurnameValid(String controller) {
    if (controller.length > 1) {
      SignUp.surnameValid = true;
      emit(const Check());
      return;
    }
    SignUp.surnameValid = false;
    emit(const Loading());
  }
}
