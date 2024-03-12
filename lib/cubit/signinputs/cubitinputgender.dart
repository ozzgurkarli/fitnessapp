import 'package:fitnessapp/Widgets/assets.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputGender extends Cubit<Widget> {
  CubitInputGender() : super(const Loading());

  bool isGenderValid(int? genderController) {
    if (genderController != null) {
      
      SignUp.genderValid = true;
      emit(const Check());
      return true;
    }

    SignUp.genderValid = false;
    emit(const Loading());
    return false;
  }
}
