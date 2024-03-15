import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/widgets/alertdialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitWelcomeLanguage extends Cubit<int>
{
  CubitWelcomeLanguage(): super(0);
  SPChanges sp = SPChanges();

  void changeLanguage(BuildContext context){
    sp.setLanguage(ConstantText.index);
    showDialog(context: context, builder: (context) => AlertDialogInputOneActionValid(ConstantText.LANGUAGEWILLCHANGE[ConstantText.index]),);
    emit(ConstantText.index);
  }
}