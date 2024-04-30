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

class CubitMove extends Cubit<List<ModelMove>>
{
  CubitMove():super(List.empty());

  DatabaseMove dbMove = DatabaseMove();

  void getMovesByMuscle(BuildContext context, String muscleName)async{
    List<ModelMove> list = [];
    http.Response response = await dbMove.getMovesByMuscle(muscleName);
      if (response.statusCode <= 299) {
        for(var item in json.decode(response.body)){
          list.add(ModelMove.fromJson(item));
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