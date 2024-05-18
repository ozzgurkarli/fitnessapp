import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/helpermethods.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelworkout.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitworkouthistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutHistory extends StatefulWidget {
  const WorkoutHistory({super.key});

  @override
  State<WorkoutHistory> createState() => _WorkoutHistoryState();
}

class _WorkoutHistoryState extends State<WorkoutHistory> {
  @override
  Widget build(BuildContext context) {
    context.read<CubitWorkoutHistory>().workoutHistoryMap(context);

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: ColorC.thirdColor,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: ColorC.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<CubitWorkoutHistory, Map>(builder: (context, map) {
              return SizedBox(
                height: Sizes.height / 1.1,
                width: Sizes.width,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: map.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(Sizes.height * 0.03),
                            child: Container(
                              width: Sizes.width / 3.3,
                              height: Sizes.height / 25,
                              decoration: BoxDecoration(
                                  color: ColorC.thirdColor,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: ColorC.faultGLast,
                                      offset: Offset(3, 3),
                                    )
                                  ]),
                              child: Align(
                                child: Text(
                                  map.keys.toList()[index],
                                  style: const TextStyle(
                                      color: ColorC.textColor, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Sizes.width * 43 / 60,
                            height: Sizes.height /
                                10 *
                                map.values.toList()[index].length + ((map.values.toList()[index].length -1) * Sizes.height * 0.01),
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: map.values.toList()[index].length,
                                itemBuilder: (context, innerIndex) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: Sizes.height * 0.01),
                                    child: SizedBox(
                                        height: Sizes.height / 10,
                                        width: Sizes.width * 43 / 60,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: map.values
                                                          .toList()[index]
                                                              [innerIndex]
                                                          .completed
                                                      ? ColorC.defaultGradient
                                                      : ColorC.faultGradient),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          width: Sizes.width * 43 / 60,
                                          height: Sizes.height / 10,
                                          child: ListTile(
                                            onTap: () {},
                                            tileColor: Colors.transparent,
                                            subtitle: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  map.values
                                                      .toList()[index][innerIndex]
                                                      .programName,
                                                  style: const TextStyle(
                                                      color: ColorC.textColor,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                Text(
                                                  map.values
                                                          .toList()[index]
                                                              [innerIndex]
                                                          .completed
                                                      ? HelperMethods.editDuration(map.values
                                                          .toList()[index]
                                                              [innerIndex]
                                                          .duration)
                                                          .toString()
                                                      : ConstantText.NOTSTARTED[
                                                          ConstantText.index],
                                                  style: const TextStyle(
                                                      color: ColorC.textColor,
                                                      fontWeight: FontWeight.w600),
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
