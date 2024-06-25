import 'package:fitnessapp/common/constants/colors.dart';
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
  double heaviestWeight = 0;
  @override
  Widget build(BuildContext context) {
    heaviestWeight =
        context.read<CubitWorkoutHistory>().findHeaviestWeight(widget.moveList);
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: Center(
          child: SizedBox(
        width: Sizes.width,
        height: Sizes.height,
        child: ListView.builder(
          itemCount: widget.moveList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: Sizes.width,
                height: Sizes.height / 6,
                child: Card(
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
                            maxValue: heaviestWeight,
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
                        children: [
                          Column(
                            children: [Text("data")],
                          ),
                          Container(
                            width: 3,
                            height: Sizes.height/20,
                            color: Colors.red,
                          ),
                          Column(
                            children: [Text("data")],
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
      )),
    );
  }
}
