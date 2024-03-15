import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputcheckvalid.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputmail.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputname.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputpassword.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputsigninvalid.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputsurname.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputOnChanged extends Cubit<void> {
  CubitInputOnChanged() : super(null);

  void onChanged(BuildContext context, String labelText, String value,
      TextEditingController controller) {
    if (labelText == ConstantText.NAME[ConstantText.index]) {
      context.read<CubitInputName>().isNameValid(value);
    } else if (labelText == ConstantText.SURNAME[ConstantText.index]) {
      context.read<CubitInputSurname>().isSurnameValid(value);
    } else if (labelText == ConstantText.EMAIL[ConstantText.index]) {
      context.read<CubitInputMail>().isMailValid(value);
    }
    context.read<CubitInputCheckValid>().checkValidSignUp();
    context.read<CubitInputSignInValid>().checkValidSignIn();
  }

  void onChangedPassword(BuildContext context, String labelText, String value,
      TextEditingController controller) {
    if (value.length > 6) {
      value = value.substring(0, 6);
      controller.text = controller.text.substring(0, 6);
    }
    context.read<CubitInputPassword>().isPasswordValid(value);
    context.read<CubitInputCheckValid>().checkValidSignUp();
    context.read<CubitInputSignInValid>().checkValidSignIn();
  }
}
