// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/idCountTypes.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelprogram.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';
import 'package:fitnessapp/database/databaseidcount.dart';
import 'package:fitnessapp/database/databasemove.dart';
import 'package:fitnessapp/database/databaseprogram.dart';
import 'package:fitnessapp/database/databaseprogrammove.dart';
import 'package:fitnessapp/presentation/basic/ground.dart';
import 'package:fitnessapp/presentation/helpers/createprogrampage.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCreateProgramMovesList extends Cubit<void> {
  CubitCreateProgramMovesList() : super(List.empty());

  DatabaseMove dbMove = DatabaseMove();
  DatabaseProgramMove dbProgramMove = DatabaseProgramMove();
  DatabaseIDCount dbCount = DatabaseIDCount();
  DatabaseProgram dbProgram = DatabaseProgram();

  List<ModelProgramMove> list = [];
  int indexCounter = 0;

  Future<Widget?> showAddedMoves(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Sizes.width / 1.6,
                    height: Sizes.height / 100 * 7 * list.length,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: Sizes.width / 1.6,
                              height: Sizes.height / 100 * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: const LinearGradient(
                                      colors: ColorC.defaultGradient)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: Sizes.width / 40),
                                    child: Text(
                                      list[index].moveName!,
                                      style: const TextStyle(
                                          color: ColorC.textColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: Sizes.width * 0.02),
                                    child: GestureDetector(
                                      onTap: () {
                                        removeFromProgram(list[index].index!);
                                        Navigator.pop(context);
                                        showAddedMoves(context);
                                      },
                                      child: const Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Sizes.height / 40,
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ));
  }

  void addToProgram(
      String muscle, String? moveName, BuildContext context) async {
    if (!checkValid(moveName, context)) {
      return;
    }
    list.add(ModelProgramMove(muscle, indexCounter++, moveName: moveName));
    list[indexCounter - 1].moveId =
        await findIdByMoveName(list[indexCounter - 1], moveName!);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: EdgeInsets.all(Sizes.height / 20),
      content: Align(
          alignment: Alignment.center,
          child: Text(ConstantText.MOVEADDED[ConstantText.index])),
      backgroundColor: ColorC.foregroundColor,
      showCloseIcon: true,
      closeIconColor: ColorC.thirdColor,
      behavior: SnackBarBehavior.floating,
    ));
    CreateProgramPage.moveController = null;
  }

  void removeFromProgram(int index) async {
    indexCounter--;
    for (int i = index; i < list.length - 1; i++) {
      list[i + 1].index = list[i + 1].index! - 1;
      list[i] = list[i + 1];
    }
    list.removeAt(list.length - 1);
  }

  bool checkValid(String? moveName, BuildContext context) {
    if (CreateProgramPage.moveController == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(Sizes.height / 20),
        content: Align(
            alignment: Alignment.center,
            child: Text(ConstantText.MOVEISNOTSELECTED[ConstantText.index])),
        backgroundColor: ColorC.foregroundColor,
        showCloseIcon: true,
        closeIconColor: ColorC.thirdColor,
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    } else if (list.any((x) => x.moveName == moveName)) {
      if (CreateProgramPage.moveController == null ||
          list.any((x) => x.moveName == moveName)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          margin: EdgeInsets.all(Sizes.height / 20),
          content: Align(
              alignment: Alignment.center,
              child: Text(ConstantText.ALREADYADDED[ConstantText.index])),
          backgroundColor: ColorC.foregroundColor,
          showCloseIcon: true,
          closeIconColor: ColorC.thirdColor,
          behavior: SnackBarBehavior.floating,
        ));
        return false;
      }
    }
    return true;
  }

  void createProgram(BuildContext context) async {
    if (list.isEmpty) {
      return;
    }
    TextEditingController controller = TextEditingController();
    controller.text = "";
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ColorC.backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Text(
              ConstantText.PROGRAMNAME[ConstantText.index],
              style: TextStyle(color: ColorC.textColor),
            ),
            content: TextField(
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              controller: controller,
              style: const TextStyle(
                  color: ColorC.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: ColorC.foregroundColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: ColorC.foregroundColor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: ColorC.foregroundColor)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: ColorC.foregroundColor)),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: ColorC.foregroundColor))),
            ),
            actions: [
              CustomizedElevatedButton(
                () {
                  Navigator.pop(context);
                },
                ConstantText.COMPLETE[ConstantText.index],
                Icons.check,
                20,
                MainAxisAlignment.center,
                customWidth: Sizes.width / 3.5,
              )
            ],
          );
        });

    ModelProgram program = ModelProgram(0, Pool.user.id!, controller.text);
    List<ModelProgramMove> mList = listProgram();

    for (int i = 0; i < mList.length; i++) {
      insertProgramMove(program, mList[i], i);
    }

    http.Response response = await dbProgram.insertProgram(program);
    if (response.statusCode <= 299) {
      Pool.programs.add(ModelProgram.fromJson(json.decode(response.body)));
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
        MaterialPageRoute(builder: (context) => const Ground()),
        (route) => false);
  }

  void insertProgramMove(
      ModelProgram program, ModelProgramMove pMove, int index) async {
    pMove.index = index;
    pMove.programId = 0;

    program.programMoves == null
        ? program.programMoves = [pMove]
        : program.programMoves!.add(pMove);
  }

  void clearList() {
    list.clear();
    indexCounter = 0;
  }

  Future<int> findIdByMoveName(ModelProgramMove item, String moveName) async {
    return await dbMove.getIdByMoveName(item, moveName);
  }

  Future<String> findNameByMoveId(ModelProgramMove item) async {
    return await dbMove.getNameByMoveId(item);
  }

  List<ModelProgramMove> listProgram() {
    List<ModelProgramMove> mList = [];
    mList.addAll(list.where((x) => x.muscle == ConstantText.CHEST[0]));
    mList.addAll(list.where((x) => x.muscle == ConstantText.SHOULDER[0]));
    mList.addAll(list.where((x) => x.muscle == ConstantText.BACK[0]));
    mList.addAll(list.where((x) => x.muscle == ConstantText.BICEPS[0]));
    mList.addAll(list.where((x) => x.muscle == ConstantText.TRICEPS[0]));
    mList.addAll(list.where((x) => x.muscle == ConstantText.LEG[0]));
    mList.addAll(list.where((x) => x.muscle == ConstantText.ABDOMEN[0]));
    mList.addAll(list.where((x) => x.muscle == ConstantText.CARDIO[0]));

    return mList;
  }
}
