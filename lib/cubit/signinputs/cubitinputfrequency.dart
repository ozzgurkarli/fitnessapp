import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputFrequency extends Cubit<Widget> {
  CubitInputFrequency() : super(const Loading());

  bool isFrequencyValid(int? controller) {
    if (controller != null) {
      
      SignUp.frequencyValid = true;
      emit(const Check());
      return true;
    }

    SignUp.frequencyValid = false;
    emit(const Loading());
    return false;
  }
}
