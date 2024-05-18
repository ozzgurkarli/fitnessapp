import 'dart:convert';

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/helpermethods.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelworkout.dart';
import 'package:fitnessapp/common/models/modelworkoutmove.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseworkout.dart';
import 'package:fitnessapp/database/databaseworkoutmove.dart';
import 'package:fitnessapp/presentation/helpers/workoutcurrent.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CubitWorkoutBuilder extends Cubit<Widget> {
  CubitWorkoutBuilder() : super(const Center(child: Loading()));

  DatabaseWorkout dbWorkout = DatabaseWorkout();
  DatabaseWorkoutMove dbWorkoutMove = DatabaseWorkoutMove();
  SPChanges spChanges = SPChanges();

  late int workoutId;

  void workoutsPage() async {
    int userId = await spChanges.readID();
    List<ModelWorkout> list = [];
    emit(FutureBuilder(
      future: dbWorkout.getWorkoutLast12Hour(userId),
      builder: (context, response) {
        if (response.hasData) {
          if (response.data!.statusCode <= 299) {
            Pool.lastWorkout =
                ModelWorkout.fromJson(json.decode(response.data!.body));
          } else if (response.data!.statusCode == 404) {
            return SizedBox(
              width: Sizes.width * 43 / 60,
              height: Sizes.height / 10,
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        margin: EdgeInsets.all(Sizes.height / 20),
                        content: Align(
                            alignment: Alignment.center,
                            child: Text(ConstantText
                                .NOWORKOUTFOUNDIN12HOURS[ConstantText.index])),
                        backgroundColor: ColorC.foregroundColor,
                        showCloseIcon: true,
                        closeIconColor: ColorC.thirdColor,
                        behavior: SnackBarBehavior.floating,
                      ));
                    },
                    child: const NoData()),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              margin: EdgeInsets.all(Sizes.height / 20),
              content: Align(
                  alignment: Alignment.center,
                  child: Text(
                      "${ConstantText.SIGNINERROR[ConstantText.index]} + ${response.data!.body}")),
              backgroundColor: ColorC.foregroundColor,
              showCloseIcon: true,
              closeIconColor: ColorC.thirdColor,
              behavior: SnackBarBehavior.floating,
            ));
          }

          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: Pool.lastWorkout.completed!
                        ? ColorC.defaultGradient
                        : ColorC.faultGradient),
                borderRadius: BorderRadius.circular(12)),
            width: Sizes.width * 43 / 60,
            height: Sizes.height / 10,
            child: ListTile(
              onTap: () {
                workoutId = Pool.lastWorkout.id!;
                WorkoutCurrent.workout = Pool.lastWorkout;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WorkoutCurrent()));
              },
              tileColor: Colors.transparent,
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Pool.lastWorkout.programName!,
                    style: const TextStyle(
                        color: ColorC.textColor, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    Pool.lastWorkout.completed!
                        ? HelperMethods.editDuration(Pool.lastWorkout.duration!)
                        : ConstantText.NOTCOMPLETED[ConstantText.index],
                    style: const TextStyle(
                        color: ColorC.textColor, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          );
        } else if (response.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Loading(),
          );
        } else {
          if (Pool.lastWorkout.id != -1) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: Pool.lastWorkout.completed!
                          ? ColorC.defaultGradient
                          : ColorC.faultGradient),
                  borderRadius: BorderRadius.circular(12)),
              width: Sizes.width * 43 / 60,
              height: Sizes.height / 10,
              child: ListTile(
                onTap: () {
                  workoutId = Pool.lastWorkout.id!;
                  WorkoutCurrent.workout = Pool.lastWorkout;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkoutCurrent()));
                },
                tileColor: Colors.transparent,
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Pool.lastWorkout.programName!,
                      style: const TextStyle(
                          color: ColorC.textColor, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      Pool.lastWorkout.completed!
                          ? HelperMethods.editDuration(Pool.lastWorkout.duration!)
                          : ConstantText.NOTCOMPLETED[ConstantText.index],
                      style: const TextStyle(
                          color: ColorC.textColor, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            );
          }
          return SizedBox(
            width: Sizes.width * 43 / 60,
            height: Sizes.height / 10,
            child: Center(
              child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      margin: EdgeInsets.all(Sizes.height / 20),
                      content: Align(
                          alignment: Alignment.center,
                          child: Text(ConstantText
                              .NOWORKOUTFOUNDIN12HOURS[ConstantText.index])),
                      backgroundColor: ColorC.foregroundColor,
                      showCloseIcon: true,
                      closeIconColor: ColorC.thirdColor,
                      behavior: SnackBarBehavior.floating,
                    ));
                  },
                  child: const NoData()),
            ),
          );
        }
      },
    ));
  }

  void workoutCurrentPage(Widget page) async {
    List<ModelWorkoutMove> list = [];
    emit(FutureBuilder(
      future: dbWorkoutMove.getWorkoutMoves(workoutId),
      builder: (context, fList) {
        if (fList.hasData) {
          list = fList.data!;
          list.sort((a, b) => a.index!.compareTo(b.index!));
          WorkoutCurrent.moveList = list;
          return page;
        } else {
          return const Center(
            child: Loading(),
          );
        }
      },
    ));
  }

  Future<bool> deleteWorkout() async {
    dbWorkoutMove.deleteWorkoutMoves(workoutId);
    return await dbWorkout.deleteWorkout(workoutId);
  }

  int currentBulkCounter(int bulk, int addWeight) {
    return (bulk + addWeight);
  }
}
