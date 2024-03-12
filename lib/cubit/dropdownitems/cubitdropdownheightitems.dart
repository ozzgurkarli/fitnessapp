import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDropdownHeightItems extends Cubit<List<DropdownMenuItem>>
{
  CubitDropdownHeightItems(): super(List<DropdownMenuItem>.empty());

  List<DropdownMenuItem> list = [];

  void listOfHeights(){
    list.clear();
    
    for(int i= 130; i<221; i++){
      list.add(DropdownMenuItem(value: i,child: Text("$i cm", style: const TextStyle(color: Colors.white),),));
    }

    emit(list);
  }
}