import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputKg extends Cubit<Widget> {
  CubitInputKg() : super(const Loading());

  bool isKgValid(int? controller) {
    if (controller != null) {
      
      SignUp.kgValid = true;
      emit(const Check());
      return true;
    }

    SignUp.kgValid = false;
    emit(const Loading());
    return false;
  }
}
