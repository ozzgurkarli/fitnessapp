// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/idcounttypes.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';
import 'package:fitnessapp/common/models/modelworkout.dart';
import 'package:fitnessapp/common/models/modelprogram.dart';
import 'package:fitnessapp/common/models/modelworkoutmove.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitcreateprogrammoveslist.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseprogrammove.dart';
import 'package:fitnessapp/database/databaseworkout.dart';
import 'package:fitnessapp/database/databaseidcount.dart';
import 'package:fitnessapp/database/databaseprogram.dart';
import 'package:fitnessapp/database/databaseworkoutmove.dart';
import 'package:fitnessapp/presentation/basic/ground.dart';
import 'package:fitnessapp/presentation/main/createnewprogramdetail.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:darq/darq.dart';
import 'package:http/http.dart' as http;

class CubitDropdownProgramItems extends Cubit<void> {
  CubitDropdownProgramItems() : super(const Placeholder());

  List<DropdownMenuItem> list = [];

  DatabaseProgram dbProgram = DatabaseProgram();
  DatabaseWorkout dbWorkout = DatabaseWorkout();
  DatabaseIDCount dbIdCount = DatabaseIDCount();
  DatabaseProgramMove dbProgramMove = DatabaseProgramMove();
  DatabaseWorkoutMove dbWorkoutMove = DatabaseWorkoutMove();
  SPChanges spChanges = SPChanges();

  void showOptions(BuildContext context) {
    list.clear();

    showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Sizes.width / 1.6,
                    child: CustomizedElevatedButton(
                      () {
                        Navigator.pop(context);
                        showPrograms(context);
                      },
                      ConstantText.ADDFROMPROGRAMS[ConstantText.index],
                      Icons.add,
                      0,
                      MainAxisAlignment.spaceBetween,
                      customWidth: Sizes.width / 1.6,
                      leftTextMargin: Sizes.width * 0.05,
                      rightTextMargin: Sizes.width * 0.05,
                    ),
                  ),
                  SizedBox(
                    height: Sizes.height / 40,
                  ),
                  SizedBox(
                    width: Sizes.width / 1.6,
                    child: CustomizedElevatedButton(
                      () {
                        context.read<CubitCreateProgramMovesList>().clearList();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreateNewProgramDetail()));
                      },
                      ConstantText.CREATENEWPROGRAM[ConstantText.index],
                      Icons.add,
                      0,
                      MainAxisAlignment.spaceBetween,
                      customWidth: Sizes.width / 1.6,
                      leftTextMargin: Sizes.width * 0.05,
                      rightTextMargin: Sizes.width * 0.05,
                    ),
                  ),
                  SizedBox(
                    height: Sizes.height / 40,
                  ),
                  SizedBox(
                    width: Sizes.width / 1.6,
                    child: CustomizedElevatedButton(
                      () {},
                      ConstantText.ASKAITOCREATE[ConstantText.index],
                      Icons.add,
                      0,
                      MainAxisAlignment.spaceBetween,
                      customWidth: Sizes.width / 1.6,
                      leftTextMargin: Sizes.width * 0.05,
                      rightTextMargin: Sizes.width * 0.05,
                      gradientColor: ColorC.premiumGradient,
                      weight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ));
  }

  void showPrograms(BuildContext context) async {
    int userId = await spChanges.readID();
    List<ModelProgram> list = [];
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (context){
        list = Pool.programs;
            list.sort(
              (a, b) => b.id.compareTo(a.id),
            );
            return Center(
              child: SizedBox(
                width: Sizes.width / 1.6,
                height: Sizes.height * 0.066 * list.length,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          width: Sizes.width / 1.6,
                          child: CustomizedElevatedButton(
                            () async {
                              http.Response response = await dbWorkout.insertWorkoutByProgramId(list[index].id);
                              if (response.statusCode <= 299) {
                                Pool.lastWorkout =ModelWorkout.fromJson( json.decode(response.body));
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
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Ground()),
                                  (route) => false);
                            },
                            list[index].programName,
                            Icons.add,
                            0,
                            MainAxisAlignment.spaceBetween,
                            customWidth: Sizes.width / 1.6,
                            leftTextMargin: Sizes.width * 0.05,
                            rightTextMargin: Sizes.width * 0.05,
                          ),
                        ),
                        SizedBox(
                          height: Sizes.height / 40,
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
      }
    );
  }

  void insertWorkoutMoves(int programId, int workoutId) async {
    List<ModelProgramMove> pList =
        await dbProgramMove.getProgramMoves(programId);

    for (int i = 0; i < pList.length; i++) {
      dbWorkoutMove.insertMove(ModelWorkoutMove(
        pList[i].muscle,
        pList[i].index,
        workoutId: workoutId,
        moveId: pList[i].moveId,
        moveName: pList[i].moveName,
        duration: 0,
        repeat: 0,
        weight: 0,
        setCount: 0
      ));
    }
  }
}
