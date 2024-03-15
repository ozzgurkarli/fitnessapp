import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/widgets/createprogrampages.dart';
import 'package:flutter/material.dart';

class CreateNewProgramDetail extends StatefulWidget {
  const CreateNewProgramDetail({super.key});

  @override
  State<CreateNewProgramDetail> createState() => _CreateNewProgramDetailState();
}

class _CreateNewProgramDetailState extends State<CreateNewProgramDetail> {
  List<List<String>> list = [ConstantText.ABDOMEN, ConstantText.BACK, ConstantText.CHEST];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: ColorC.foregroundColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
          child: PageView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return CreateProgramPage(list[index]);
        },
      )),
    );
  }
}
