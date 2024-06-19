import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelworkoutmove.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class WorkoutHistoryDetail extends StatefulWidget {
  List<dynamic> moveList;
  WorkoutHistoryDetail({super.key, required this.moveList});

  @override
  State<WorkoutHistoryDetail> createState() => _WorkoutHistoryDetailState();
}

class _WorkoutHistoryDetailState extends State<WorkoutHistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: Center(
        child: SizedBox(
                    width: Sizes.width,
                    height: Sizes.height/2, 
          child: ListView.builder(
              itemCount: widget.moveList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: Sizes.width/2,
                    height: Sizes.height/6,
                    child: Card(
                      color: ColorC.foregroundColor,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    widget.moveList[index]["moveName"]!,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    widget.moveList[index]["muscle"]!,
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                              SimpleCircularProgressBar(
                                size: 67,
                                valueNotifier: ValueNotifier(widget.moveList[index]["weight"]!),
                                mergeMode: true,
                                onGetText: (double value) {
                                  return Text(
                                    '${value.toInt()}',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  );
                                },
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
