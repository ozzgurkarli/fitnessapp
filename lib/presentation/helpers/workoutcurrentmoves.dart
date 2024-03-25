import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitbulkcounter.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitworkoutbuilder.dart';
import 'package:fitnessapp/presentation/helpers/workoutcurrent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutCurrentMoves extends StatefulWidget {
  const WorkoutCurrentMoves({super.key});

  @override
  State<WorkoutCurrentMoves> createState() => _WorkoutCurrentMovesState();
}

class _WorkoutCurrentMovesState extends State<WorkoutCurrentMoves> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorC.thirdColor,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(Sizes.width / 17),
                width: Sizes.width / 3,
                height: Sizes.height / 10,
                decoration: BoxDecoration(
                    color: ColorC.backgroundColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Horizon',
                      ),
                      child: BlocBuilder<CubitBulkCounter, String>(
                        builder: (context, bulk) {
                          return AnimatedTextKit(
                            pause: const Duration(milliseconds: 300),
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText(
                                  ConstantText.CURRENTBULK0[ConstantText.index]),
                              RotateAnimatedText(
                                  ConstantText.CURRENTBULK1[ConstantText.index]),
                              RotateAnimatedText(
                                  bulk),
                            ],
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PageView.builder(
              itemCount: WorkoutCurrent.moveList.length,
              itemBuilder: (context, index) {
                return currentMove(context, index);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget currentMove(BuildContext context, int index) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: Sizes.height * 6 / 33),
            height: Sizes.height / 3.3,
            child: Image.asset(
                'lib/common/assets/${WorkoutCurrent.moveList[index].muscle}.png')),
      ],
    );
  }
}
