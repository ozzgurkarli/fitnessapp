// ignore_for_file: must_be_immutable

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelprogrammove.dart';
import 'package:fitnessapp/cubit/dropdownitems/cubitdropdownmoves.dart';
import 'package:fitnessapp/cubit/newprogramscreen/cubitcreateprogrammoveslist.dart';
import 'package:fitnessapp/database/databasemove.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:fitnessapp/widgets/packagedropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProgramPage extends StatefulWidget {
  CreateProgramPage(this.label, this.controller, {super.key});

  List<String> label;
  PageController controller;
  static String? moveController;

  @override
  State<CreateProgramPage> createState() => _CreateProgramPageState();
}

class _CreateProgramPageState extends State<CreateProgramPage> {
  DatabaseMove dbMove = DatabaseMove();
  ModelProgramMove filter = ModelProgramMove.empty();
  @override
  Widget build(BuildContext context) {
    context.read<CubitDropDownMoves>().listOfMoves(widget.label[0]);
    CreateProgramPage.moveController = null;

    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Sizes.height / 14,
              ),
              Image.asset('lib/common/assets/${widget.label[0]}.png'),
              SizedBox(
                height: Sizes.height / 14,
              ),
              FutureBuilder(
                future: context
                    .read<CubitDropDownMoves>()
                    .listOfMoves(widget.label[0]),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropDownMove(snapshot.data!);
                  } else {
                    return const Loading();
                  }
                },
              ),
              SizedBox(
                height: Sizes.height / 20,
              ),
              SizedBox(
                  width: Sizes.width / 1.6,
                  child: BlocBuilder<CubitCreateProgramMovesList, void>(
                      builder: (context, state) {
                    return CustomizedElevatedButton(() {
                      context
                          .read<CubitCreateProgramMovesList>()
                          .showAddedMoves(context);
                    },
                        ConstantText.ADDEDMOVES[ConstantText.index],
                        Icons.keyboard_arrow_down,
                        0,
                        MainAxisAlignment.spaceBetween);
                  })),
              SizedBox(
                height: Sizes.height / 30,
              ),
              CustomizedElevatedButton(
                () {
                  if (CreateProgramPage.moveController != null) {
                    context.read<CubitCreateProgramMovesList>().addToProgram(
                        widget.label[0], CreateProgramPage.moveController!);
                  }
                },
                ConstantText.ADDMOVE[ConstantText.index],
                Icons.add,
                0,
                MainAxisAlignment.spaceBetween,
                customWidth: Sizes.width / 1.6,
              ),
              SizedBox(
                height: Sizes.height / 20,
              ),
              CustomizedElevatedButton(
                () {
                  widget.controller.animateToPage(
                      widget.controller.page!.toInt() + 1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
                ConstantText.NEXT[ConstantText.index],
                Icons.keyboard_arrow_right,
                0,
                MainAxisAlignment.spaceBetween,
                customWidth: Sizes.width / 1.6,
                gradientColor: ColorC.defaultGradient,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
