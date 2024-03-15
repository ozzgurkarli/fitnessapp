import 'package:fitnessapp/common/models/modelmove.dart';
import 'package:fitnessapp/database/databasemove.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDropDownMoves extends Cubit<List<DropdownMenuItem>> {
  CubitDropDownMoves() : super(List.empty());

  bool checked = false;
  bool checkedHelper = false;
  List<DropdownMenuItem> list = [];
  List<ModelMove> moveList = [];

  DatabaseMove dbMove = DatabaseMove();

  Future<List<DropdownMenuItem>?> listOfMoves(String labelMuscle) async {
    list.clear();
    moveList = await dbMove.getMovesByMuscle(labelMuscle);

    for (int i = 0; i < moveList.length; i++) {
      ModelMove item = moveList[i];
      if (list.length == i) {
        list.add(DropdownMenuItem(
          value: item.moveName,
          child: Text(item.moveName, style: TextStyle(color: Colors.white)),
        ));
      }
      if (list.length == moveList.length) {
        return list;
      }
    }
    return null;
  }
}
