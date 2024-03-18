import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDropDownLanguage extends Cubit<List<DropdownMenuItem>>
{
  CubitDropDownLanguage(): super(List.empty());

  List<DropdownMenuItem> list = [];
  void listOfLanguages(){
    list.clear();
    for(int i=0; i<ConstantText.LANGUAGES.length; i++){
      list.add(DropdownMenuItem(value: i,child: Text(ConstantText.LANGUAGES[i], style: const TextStyle(color: ColorC.textColor),),));
    }

    emit(list);
  }
}