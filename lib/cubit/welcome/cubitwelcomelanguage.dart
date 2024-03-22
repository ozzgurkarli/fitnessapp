import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitWelcomeLanguage extends Cubit<int>
{
  CubitWelcomeLanguage(): super(0);
  SPChanges sp = SPChanges();

  void changeLanguage(BuildContext context){
    sp.setLanguage(ConstantText.index);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: EdgeInsets.all(Sizes.height / 20),
      content: Align(
          alignment: Alignment.center,
          child: Text(ConstantText.LANGUAGEWILLCHANGE[ConstantText.index])),
      backgroundColor: ColorC.foregroundColor,
      showCloseIcon: true,
      closeIconColor: ColorC.thirdColor,
      behavior: SnackBarBehavior.floating,
    ));
    emit(ConstantText.index);
  }
}