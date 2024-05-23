import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitbulkcounter.dart';
import 'package:fitnessapp/cubit/program-workout-move/cubitworkoutbuilder.dart';
import 'package:fitnessapp/presentation/helpers/workoutcurrent.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutCurrentMoves extends StatefulWidget {
  const WorkoutCurrentMoves({super.key});

  @override
  State<WorkoutCurrentMoves> createState() => _WorkoutCurrentMovesState();
}

class _WorkoutCurrentMovesState extends State<WorkoutCurrentMoves> {

  TextEditingController weightController = TextEditingController();
  TextEditingController repeatController = TextEditingController();

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
                            RotateAnimatedText(bulk),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            PageView.builder(
              itemCount: WorkoutCurrent.moveList.length,
              itemBuilder: (context, index) {
                return GestureDetector(onTap: () {FocusManager.instance.primaryFocus?.unfocus();}, child: SingleChildScrollView(child: currentMove(context, index)));
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
            margin: EdgeInsets.only(top: Sizes.height * 5 / 33),
            height: Sizes.height / 3.3,
            child: Image.asset(
                'lib/common/assets/${WorkoutCurrent.moveList[index].muscle}.png')),
        SizedBox(height: Sizes.height/100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(WorkoutCurrent.moveList[index].moveName!, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Colors.white),),
            IconButton(onPressed: (){}, icon: const Icon(Icons.info_outline, color: Colors.white,))
          ],
        ),
        SizedBox(height: Sizes.height/20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: Sizes.width/4, child: CustomizedTextField(weightController, "${ConstantText.WEIGHT[ConstantText.index]} (${ConstantText.KG[ConstantText.index]})", true, true)),
            SizedBox(width: Sizes.width/8,),
            SizedBox(width: Sizes.width/4, child: CustomizedTextField(weightController, ConstantText.REPEAT[ConstantText.index], true, true)),
          ],
        ),
        SizedBox(height: Sizes.height/50,),
        CustomizedElevatedButton(
          () {},
          ConstantText.COMPLETESET[ConstantText.index],
          Icons.check,
          0,
          MainAxisAlignment.spaceBetween,
          customWidth: Sizes.width / 1.6,
          leftTextMargin: Sizes.width * 0.07,
          rightTextMargin: Sizes.width * 0.07,
          gradientColor: ColorC.thirdGradient,
        ),
        SizedBox(height: Sizes.height/20,),
        CustomizedElevatedButton(
          () {},
          ConstantText.PREVIOUSMOVE[ConstantText.index],
          Icons.arrow_back,
          0,
          MainAxisAlignment.spaceBetween,
          customWidth: Sizes.width / 1.6,
          leftTextMargin: Sizes.width * 0.07,
          rightTextMargin: Sizes.width * 0.07,
          gradientColor: ColorC.thirdGradient,
        ),
        SizedBox(height: Sizes.height/100,),
        CustomizedElevatedButton(
          () {},
          ConstantText.NEXTMOVE[ConstantText.index],
          Icons.arrow_forward,
          0,
          MainAxisAlignment.spaceBetween,
          customWidth: Sizes.width / 1.6,
          leftTextMargin: Sizes.width * 0.07,
          rightTextMargin: Sizes.width * 0.07,
          gradientColor: ColorC.thirdGradient,
        ),
      ],
    );
  }
}
