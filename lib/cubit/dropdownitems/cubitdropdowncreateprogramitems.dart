// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/idcounttypes.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelexercise.dart';
import 'package:fitnessapp/common/models/modelprogram.dart';
import 'package:fitnessapp/cubit/newprogramscreen/cubitcreateprogrammoveslist.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseexercise.dart';
import 'package:fitnessapp/database/databaseidcount.dart';
import 'package:fitnessapp/database/databaseprogram.dart';
import 'package:fitnessapp/presentation/basic/ground.dart';
import 'package:fitnessapp/presentation/main/createnewprogramdetail.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDropdownProgramItems extends Cubit<void> {
  CubitDropdownProgramItems() : super(const Placeholder());

  List<DropdownMenuItem> list = [];

  DatabaseProgram dbProgram = DatabaseProgram();
  DatabaseExercise dbExercise = DatabaseExercise();
  DatabaseIDCount dbIdCount = DatabaseIDCount();
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
                    child: CustomizedElevatedButton(() {
                      Navigator.pop(context);
                      showPrograms(context);
                    }, ConstantText.ADDFROMPROGRAMS[ConstantText.index],
                        Icons.add, 0, MainAxisAlignment.spaceBetween),
                  ),
                  SizedBox(
                    height: Sizes.height / 40,
                  ),
                  SizedBox(
                    width: Sizes.width / 1.6,
                    child: CustomizedElevatedButton(() {
                      context.read<CubitCreateProgramMovesList>().clearList();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CreateNewProgramDetail()));
                    }, ConstantText.CREATENEWPROGRAM[ConstantText.index],
                        Icons.add, 0, MainAxisAlignment.spaceBetween),
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
      builder: (context) => FutureBuilder(
        future: dbProgram.getProgramsById(userId),
        builder: (context, fList) {
          if (fList.hasData) {
            list = fList.data!;
            list.sort((a, b) => b.recordDate.compareTo(a.recordDate),);
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
                          child: CustomizedElevatedButton(() async{
                            int exerciseId = await dbIdCount.getCountAndIncrease(IDCountTypes.exerciseId);
                            dbExercise.insertExercise(ModelExercise(exerciseId, userId, list[index].programId, list[index].programName, Timestamp.now(), false));
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const Ground()), (route) => false);
                          }, list[index].programName,
                              Icons.add, 0, MainAxisAlignment.spaceBetween),
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
          } else if (ConnectionState.waiting == fList.connectionState) {
            return const Center(child: Loading());
          } else {
            return const Loading();
          }
        },
      ),
    );
  }
}
