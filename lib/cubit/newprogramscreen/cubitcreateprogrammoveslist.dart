import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';
import 'package:fitnessapp/database/databasemove.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCreateProgramMovesList extends Cubit<void> {
  CubitCreateProgramMovesList() : super(List.empty());

  DatabaseMove dbMove = DatabaseMove();

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
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      removeFromProgram(list[index].index!);
                                      Navigator.pop(context);
                                      showAddedMoves(context);
                                    },
                                    child: const Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
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

  void addToProgram(String muscle, String moveName) async {
    list.add(ModelProgramMove(muscle, indexCounter++, moveName: moveName));
  }

  void removeFromProgram(int index) async {
    indexCounter--;
    for (int i = index; i < list.length - 1; i++) {
      list[i + 1].index = list[i + 1].index! - 1;
      list[i] = list[i + 1];
    }
    list.removeAt(list.length - 1);
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
