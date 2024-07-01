import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorC.backgroundColor,
      body: Center(
        child: Column(
          children: [
            CustomizedElevatedButton(() { }, ConstantText.STATISTICS[ConstantText.index], Icons.trending_up, 0, MainAxisAlignment.center),
            CustomizedElevatedButton(() { }, ConstantText.MOVECATALOG[ConstantText.index], Icons.dvr, 0, MainAxisAlignment.center)
          ],
        ),
      ),
    );
  }
}
