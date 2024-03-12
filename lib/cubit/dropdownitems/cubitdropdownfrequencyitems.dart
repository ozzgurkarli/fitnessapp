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
    
    list.add(DropdownMenuItem(value: SportsFrequency.NEVER,child: const Text(ConstantText.NEVER, style: TextStyle(color: Colors.white),),));
    list.add(DropdownMenuItem(value: SportsFrequency.BETWEEN1AND3INMONTH,child: const Text(ConstantText.BETWEEN1AND3INMONTH, style: TextStyle(color: Colors.white),),));
    list.add(DropdownMenuItem(value: SportsFrequency.BETWEEN1AND2INWEEK,child: const Text(ConstantText.BETWEEN1AND2INWEEK, style: TextStyle(color: Colors.white),),));
    list.add(DropdownMenuItem(value: SportsFrequency.PLUS3INWEEK,child: const Text(ConstantText.PLUS3INWEEK, style: TextStyle(color: Colors.white),),));
    list.add(DropdownMenuItem(value: SportsFrequency.EVERYDAY,child: const Text(ConstantText.EVERYDAY, style: TextStyle(color: Colors.white),),));

    emit(list);
  }
}