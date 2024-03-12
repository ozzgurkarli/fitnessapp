import 'package:fitnessapp/Widgets/assets.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputBirthDate extends Cubit<Widget>
{
  CubitInputBirthDate(): super(const Placeholder());

  bool isDateValid(String controller) {
    if (controller.length == 10) {
      SignUp.birthDateValid = true;
      emit(const Check());
      return true;
    }

    SignUp.birthDateValid = false;
    emit(const Loading());
    return false;
  }
}