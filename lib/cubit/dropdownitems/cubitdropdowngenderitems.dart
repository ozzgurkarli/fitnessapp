import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDropdownGenderItems extends Cubit<List<DropdownMenuItem>>
{
  CubitDropdownGenderItems(): super(List<DropdownMenuItem>.empty());

  List<DropdownMenuItem> list = [];

  void listOfGenders(){
    list.clear();
    
    list.add(DropdownMenuItem(value: 0,child: Text(ConstantText.FEMALE[ConstantText.index], style: const TextStyle(color: ColorC.textColor),),));
    list.add(DropdownMenuItem(value: 1,child: Text(ConstantText.MALE[ConstantText.index], style: const TextStyle(color: ColorC.textColor),),));

    emit(list);
  }
}