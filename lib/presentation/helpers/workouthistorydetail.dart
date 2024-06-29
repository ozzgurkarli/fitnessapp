import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelworkoutmove.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitworkouthistory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class WorkoutHistoryDetail extends StatefulWidget {
  List<dynamic> moveList;
  WorkoutHistoryDetail({super.key, required this.moveList});

  @override
  State<WorkoutHistoryDetail> createState() => _WorkoutHistoryDetailState();
}

class _WorkoutHistoryDetailState extends State<WorkoutHistoryDetail> {
  double highestWeight = 0;
  double totalWeight = 0;
  int totalSet = 0;
  @override
  Widget build(BuildContext context) {
    highestWeight = context
        .read<CubitWorkoutHistory>()
        .findHighest(widget.moveList, "weight");
    totalWeight = context
        .read<CubitWorkoutHistory>()
        .findTotal(widget.moveList, "weight");
    totalSet = context
        .read<CubitWorkoutHistory>()
        .findTotal(widget.moveList, "setCount");
    if(widget.moveList[0]["moveName"] != ConstantText.TOTAL[ConstantText.index]){
      widget.moveList.insert(0, {"highestWeight": highestWeight, "setCount": totalSet, "weight": totalWeight, "moveName": ConstantText.TOTAL[ConstantText.index], "muscle": ConstantText.WEIGHT[ConstantText.index] });
    }
    else{
      totalSet = widget.moveList[0]["setCount"];
      totalWeight = widget.moveList[0]["weight"];
    }
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: Center(
          child: SizedBox(
            width: Sizes.width - Sizes.width / 20,
            height: Sizes.height,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView.builder(
                itemCount: widget.moveList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: Sizes.width - Sizes.width / 20,
                      height: Sizes.height / 5,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: ColorC.foregroundColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Sizes.height / 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Sizes.width / 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.moveList[index]["moveName"]!,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: ColorC.thirdColor),
                                    ),
                                    Text(
                                      widget.moveList[index]["muscle"]!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: ColorC.backgroundColor),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                SimpleCircularProgressBar(
                                  size: 67,
                                  progressStrokeWidth: 10,
                                  backStrokeWidth: 10,
                                  maxValue: totalWeight,
                                  valueNotifier: ValueNotifier(
                                      widget.moveList[index]["weight"]!),
                                  mergeMode: true,
                                  onGetText: (double value) {
                                    return Text(
                                      '${value.toInt()} kg',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: Sizes.width / 10,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      ConstantText.COMPLETEDSETCOUNT[
                                          ConstantText.index],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: ColorC.backgroundColor),
                                    ),
                                    Text(
                                      "${widget.moveList[index]["setCount"]!}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: ColorC.backgroundColor),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: Sizes.height / 100),
                                  child: Container(
                                    width: 7,
                                    height: Sizes.height / 11,
                                    decoration: BoxDecoration(
                                        color: ColorC.backgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      ConstantText
                                          .HEAVIESTWEIGHT[ConstantText.index],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: ColorC.backgroundColor),
                                    ),
                                    Text(
                                      "${widget.moveList[index]["highestWeight"]!} ${ConstantText.KG[ConstantText.index]}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: ColorC.backgroundColor),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )),
    );
  }
}
