import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDropdownKgItems extends Cubit<List<DropdownMenuItem>>
{
  CubitDropdownKgItems(): super(List<DropdownMenuItem>.empty());

  List<DropdownMenuItem> list = [];

  void listOfKgs(){
    list.clear();
    
    for(int i= 30; i<161; i++){
      list.add(DropdownMenuItem(value: i,child: Text("$i kg", style: const TextStyle(color: Colors.white),),));
    }

    emit(list);
  }
}