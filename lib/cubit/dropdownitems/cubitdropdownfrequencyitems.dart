import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/sportsfrequency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDropdownFrequencyItems extends Cubit<List<DropdownMenuItem>>
{
  CubitDropdownFrequencyItems(): super(List<DropdownMenuItem>.empty());

  List<DropdownMenuItem> list = [];

  void listOfFrequencies(){
    list.clear();
    
    list.add(DropdownMenuItem(value: SportsFrequency.NEVER,child: Text(ConstantText.NEVER[ConstantText.index], style: TextStyle(color: Colors.white),),));
    list.add(DropdownMenuItem(value: SportsFrequency.BETWEEN1AND3INMONTH,child: Text(ConstantText.BETWEEN1AND3INMONTH[ConstantText.index], style: TextStyle(color: Colors.white),),));
    list.add(DropdownMenuItem(value: SportsFrequency.BETWEEN1AND2INWEEK,child: Text(ConstantText.BETWEEN1AND2INWEEK[ConstantText.index], style: TextStyle(color: Colors.white),),));
    list.add(DropdownMenuItem(value: SportsFrequency.PLUS3INWEEK,child: Text(ConstantText.PLUS3INWEEK[ConstantText.index], style: TextStyle(color: Colors.white),),));
    list.add(DropdownMenuItem(value: SportsFrequency.EVERYDAY,child: Text(ConstantText.EVERYDAY[ConstantText.index], style: TextStyle(color: Colors.white),),));

    emit(list);
  }
}