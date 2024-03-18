import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDropdownKgItems extends Cubit<List<DropdownMenuItem>>
{
  CubitDropdownKgItems(): super(List<DropdownMenuItem>.empty());

  List<DropdownMenuItem> list = [];
  double value = 0;

  void listOfKgs(){
    list.clear();
    
    for(int i= 30; i<161; i++){
      ConstantText.index == 0 ? value = (i * 2.2046).ceilToDouble(): value = i.toDouble(); 
      list.add(DropdownMenuItem(value: i,child: Text("$value ${ConstantText.KG[ConstantText.index]}", style: const TextStyle(color: ColorC.textColor),),));
    }

    emit(list);
  }
}