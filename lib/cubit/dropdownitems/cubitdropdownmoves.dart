import 'dart:convert';

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/muscle.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelmove.dart';
import 'package:fitnessapp/database/databasemove.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CubitDropDownMoves extends Cubit<List<DropdownMenuItem>> {
  CubitDropDownMoves() : super(List.empty());

  bool checked = false;
  bool checkedHelper = false;
  List<DropdownMenuItem> list = [];
  List<ModelMove> moveList = [];

  DatabaseMove dbMove = DatabaseMove();

  Future<List<DropdownMenuItem>?> listOfMoves(BuildContext context, String labelMuscle) async {
    list.clear();
    moveList.clear();
    http.Response response = await dbMove.getMovesByMuscle(labelMuscle.toUpperCase());
      if (response.statusCode <= 299) {
        list.clear();
        moveList.clear();
        for(var item in json.decode(response.body)){
          moveList.add(ModelMove.fromJson(item));
        }
        emit(list);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          margin: EdgeInsets.all(Sizes.height / 20),
          content: Align(
              alignment: Alignment.center,
              child: Text(
                  "${ConstantText.SIGNINERROR[ConstantText.index]} + ${response.body}")),
          backgroundColor: ColorC.foregroundColor,
          showCloseIcon: true,
          closeIconColor: ColorC.thirdColor,
          behavior: SnackBarBehavior.floating,
        ));
      }

    for (int i = 0; i < moveList.length; i++) {
      ModelMove item = moveList[i];
      if (list.length == i) {
        list.add(DropdownMenuItem(
          value: item.moveName,
          child: Text(item.moveName, style: const TextStyle(color: ColorC.textColor)),
        ));
      }
      if (list.length == moveList.length) {
        return list;
      }
    }
    return null;
  }

  int findMuscleId(String muscleName){
    if(muscleName == ConstantText.ABDOMEN[0]){
      return Muscle.ABDOMEN;
    }
    else if(muscleName == ConstantText.BACK[0]){
      return Muscle.BACK;
    }
    else if(muscleName == ConstantText.BICEPS[0]){
      return Muscle.BICEPS;
    }
    else if(muscleName == ConstantText.CARDIO[0]){
      return Muscle.CARDIO;
    }
    else if(muscleName == ConstantText.CHEST[0]){
      return Muscle.CHEST;
    }
    else if(muscleName == ConstantText.LEG[0]){
      return Muscle.LEG;
    }
    else if(muscleName == ConstantText.SHOULDER[0]){
      return Muscle.SHOULDER;
    }
    else if(muscleName == ConstantText.TRICEPS[0]){
      return Muscle.TRICEPS;
    }

    return 99;
  }
}
