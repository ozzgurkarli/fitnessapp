// ignore_for_file: must_be_immutable

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:flutter/material.dart';

class CreateProgramPage extends StatefulWidget {
  CreateProgramPage(this.label, {super.key});

  List<String> label;

  @override
  State<CreateProgramPage> createState() => _CreateProgramPageState();
}

class _CreateProgramPageState extends State<CreateProgramPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/common/assets/${widget.label[0]}.png')
          ],
        ),
      ),
    );
  }
}
