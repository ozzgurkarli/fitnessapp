import 'dart:convert';

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:darq/darq.dart';
import 'package:fitnessapp/common/constants/helpermethods.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/models/modelworkout.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseworkout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitWorkoutHistory extends Cubit<Map<String, List<ModelWorkout>>> {
  CubitWorkoutHistory() : super(<String, List<ModelWorkout>>{});

  SPChanges spChanges = SPChanges();
  DatabaseWorkout dbWorkout = DatabaseWorkout();

  void workoutHistoryMap(BuildContext context) async {
    List<ModelWorkout> workoutList =[];
    http.Response? response =
        await dbWorkout.getWorkoutsAll(Pool.user.id!);

    if(response != null){
      if(response.statusCode <= 299){
        for(var item in json.decode(response.body)){
          workoutList.add(ModelWorkout.fromJson(item));
        }
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          margin: EdgeInsets.all(Sizes.height / 20),
          content: Align(
              alignment: Alignment.center,
              child: Text(
                  "${ConstantText.ERROR[ConstantText.index]} + ${response.body}")),
          backgroundColor: ColorC.foregroundColor,
          showCloseIcon: true,
          closeIconColor: ColorC.thirdColor,
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
    workoutList = workoutList.reversed.toList();
    var workoutIterable = workoutList.groupBy((element) => element.recordDate);
    Map<String, List<ModelWorkout>> workoutMap = {};

    late String itemToString;

    for (var item in workoutIterable) {
      itemToString =
          HelperMethods.dateToString(item.key!);
      if (workoutMap[itemToString] == null) {
        workoutMap[itemToString] = item.toList();
      } else {
        workoutMap[itemToString]!.addAll(item.toList());
      }
    }

    emit(workoutMap);
  }

  double findHighest(List<dynamic> list, String type){

    double highest = 0;

    for(var item in list){
      if(item[type] > highest) {
        highest = item[type];
      }
    }

    return highest;
  }

  dynamic findTotal(List<dynamic> list, String type){

    dynamic total = 0;

    for(var item in list){
        total += item[type];
    }

    return total;
  }
}
