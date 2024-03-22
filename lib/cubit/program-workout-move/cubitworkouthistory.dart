import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darq/darq.dart';
import 'package:fitnessapp/common/constants/helpermethods.dart';
import 'package:fitnessapp/common/models/modelworkout.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseworkout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitWorkoutHistory extends Cubit<Map<String, List<ModelWorkout>>> {
  CubitWorkoutHistory() : super(<String, List<ModelWorkout>>{});

  SPChanges spChanges = SPChanges();
  DatabaseWorkout dbWorkout = DatabaseWorkout();

  void workoutHistoryMap() async {
    List<ModelWorkout> workoutList =
        await dbWorkout.getWorkoutsAll(await spChanges.readID());
    workoutList = workoutList.reversed.toList();
    var workoutIterable = workoutList.groupBy((element) => element.recordDate);
    Map<String, List<ModelWorkout>> workoutMap = {};

    late String itemToString;

    for (var item in workoutIterable) {
      itemToString =
          HelperMethods.dateToString(item.key.toDate());
      if (workoutMap[itemToString] == null) {
        workoutMap[itemToString] = item.toList();
      } else {
        workoutMap[itemToString]!.addAll(item.toList());
      }
    }

    emit(workoutMap);
  }
}
