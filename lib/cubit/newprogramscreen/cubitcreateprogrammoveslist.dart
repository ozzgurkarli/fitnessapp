import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/idCountTypes.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/constants/user.dart';
import 'package:fitnessapp/common/models/modelprogram.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';
import 'package:fitnessapp/database/databaseidcount.dart';
import 'package:fitnessapp/database/databasemove.dart';
import 'package:fitnessapp/database/databaseprogram.dart';
import 'package:fitnessapp/widgets/createprogrampage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCreateProgramMovesList extends Cubit<void> {
  CubitCreateProgramMovesList() : super(List.empty());

  DatabaseMove dbMove = DatabaseMove();
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
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: Sizes.width * 0.02),
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
      String muscle, String moveName, BuildContext context) async {
    list.add(ModelProgramMove(muscle, indexCounter++, moveName: moveName));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: EdgeInsets.all(Sizes.height/20),
      content: Align(alignment: Alignment.center, child: Text(ConstantText.MOVEADDED[ConstantText.index])),
      backgroundColor: ColorC.thirdColor,
      showCloseIcon: true,
      closeIconColor: ColorC.foregroundColor,
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

  void createProgram(String programName)async{
    int programId = await dbCount.getCountAndIncrease(IDCountTypes.programId);
    ModelProgram program = ModelProgram(UserC.id, programId, programName, Timestamp.fromDate(DateTime.now()));

    dbProgram.insertProgram(program);
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
}
