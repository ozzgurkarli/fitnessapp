// ignore_for_file: use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelworkout.dart';
import 'package:fitnessapp/common/models/modelworkoutmove.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitworkoutbuilder.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutCurrent extends StatefulWidget {
  const WorkoutCurrent({super.key});

  static late List<ModelWorkoutMove> moveList;
  static late ModelWorkout workout;

  @override
  State<WorkoutCurrent> createState() => _WorkoutCurrentState();
}

class _WorkoutCurrentState extends State<WorkoutCurrent> {
  @override
  Widget build(BuildContext context) {
    context.read<CubitWorkoutBuilder>().workoutCurrentPage(page());

    return BlocBuilder<CubitWorkoutBuilder, Widget>(
      builder: (context, page) {
        return page;
      },
    );
  }

  Widget page() {
    return Scaffold(
      backgroundColor: ColorC.thirdColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<CubitWorkoutBuilder>().workoutsPage();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: ColorC.backgroundColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLiquidFill(
              text: WorkoutCurrent.workout.programName,
              waveColor: ColorC.backgroundColor,
              boxBackgroundColor: ColorC.thirdColor,
              textStyle: const TextStyle(
                color: ColorC.textColor,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: Sizes.height / 33),
                child: CustomizedElevatedButton(
                  () {},
                  ConstantText.STARTWORKOUT[ConstantText.index],
                  Icons.start,
                  0,
                  MainAxisAlignment.spaceBetween,
                  customWidth: Sizes.width / 1.6,
                  leftTextMargin: Sizes.width * 0.07,
                  rightTextMargin: Sizes.width * 0.07,
                  gradientColor: ColorC.thirdGradient,
                )),
            CustomizedElevatedButton(
              () async{
                await context.read<CubitWorkoutBuilder>().deleteWorkout();
                context.read<CubitWorkoutBuilder>().workoutsPage();
                Navigator.pop(context);
              },
              ConstantText.CANCELWORKOUT[ConstantText.index],
              Icons.close,
              0,
              MainAxisAlignment.spaceBetween,
              customWidth: Sizes.width / 1.6,
              leftTextMargin: Sizes.width * 0.07,
              rightTextMargin: Sizes.width * 0.07,
              gradientColor: ColorC.faultGradient,
            ),
          ],
        ),
      ),
    );
  }
}
