import 'package:fitnessapp/Widgets/assets.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputHeight extends Cubit<Widget> {
  CubitInputHeight() : super(const Loading());

  bool isHeightValid(int? controller) {
    if (controller != null) {
      
      SignUp.heightValid = true;
      emit(const Check());
      return true;
    }

    SignUp.heightValid = false;
    emit(const Loading());
    return false;
  }
}
