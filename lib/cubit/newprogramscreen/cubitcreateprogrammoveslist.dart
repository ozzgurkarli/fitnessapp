import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';
import 'package:fitnessapp/database/databasemove.dart';
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

  void addToProgram(ModelProgramMove item, String moveName) async{
    item.index = indexCounter++;
    item.moveId = await findIdByMoveName(item, moveName);
    list.add(item);
  }

  void clearList(){
    list.clear();
    indexCounter = 0;
  }

  Future<int> findIdByMoveName(ModelProgramMove item, String moveName)async{
    return await dbMove.getIdByMoveName(item, moveName);
  }
}
