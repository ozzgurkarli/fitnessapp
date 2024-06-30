import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelworkoutmove.dart';
import 'package:fitnessapp/database/databaseworkoutmove.dart';
import 'package:fitnessapp/presentation/helpers/workoutcurrent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitBulkCounter extends Cubit<String> {
  CubitBulkCounter() : super("0 ${ConstantText.KG[ConstantText.index]}");
  DatabaseWorkoutMove dbWorkoutMove = DatabaseWorkoutMove();

  void currentBulk(double bulk) {
    emit("$bulk ${ConstantText.KG[ConstantText.index]}");
  }

  bool addBulk(BuildContext context, ModelWorkoutMove move, String weightController, String repeatController) {
    bool parseable  = true;
    try {
      double.parse(weightController);
    } catch (e) {
      parseable = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(Sizes.height / 20),
        content: Align(
            alignment: Alignment.center,
            child: Text(ConstantText.INVALIDWEIGHTTYPE[ConstantText.index])),
        backgroundColor: ColorC.foregroundColor,
        showCloseIcon: true,
        closeIconColor: ColorC.thirdColor,
        behavior: SnackBarBehavior.floating,
      ));
    }
    try {
      double.parse(repeatController);
    } catch (e) {
      parseable = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(Sizes.height / 20),
        content: Align(
            alignment: Alignment.center,
            child: Text(ConstantText.INVALIDREPEATTYPE[ConstantText.index])),
        backgroundColor: ColorC.foregroundColor,
        showCloseIcon: true,
        closeIconColor: ColorC.thirdColor,
        behavior: SnackBarBehavior.floating,
      ));
    }

    if(parseable){
      Pool.lastWorkout.workoutMoves!.where((x)=> x["id"] == move.id).first["weight"] = Pool.lastWorkout.workoutMoves!.where((x)=> x["id"] == move.id).first["weight"]! + (double.parse(weightController) * int.parse(repeatController));
      dbWorkoutMove.updateWorkoutMove(ModelWorkoutMove("", 0, setCount: 0, id: move.id, moveId:0, workoutId: move.workoutId, duration: 0, moveName: "", weight: double.parse(weightController), repeat: int.parse(repeatController)));
    }
    return parseable;
  }
}
