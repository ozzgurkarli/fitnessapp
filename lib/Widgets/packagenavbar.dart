// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, this.onTabChange});

  double iosPadding = Platform.isIOS ? Sizes.width/33 : 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding:
            EdgeInsets.only(top: Sizes.height / 67, bottom: Sizes.height / 67, left: iosPadding, right: iosPadding),
        child: GNav(
          padding: Platform.isIOS ? const EdgeInsets.all(18) : const EdgeInsets.all(25),
            tabBackgroundGradient:
                const LinearGradient(colors: ColorC.defaultGradient),
            color: Colors.white,
            activeColor: Colors.white,
            mainAxisAlignment: MainAxisAlignment.center,
            tabBorderRadius: 30,
            onTabChange: (value) => onTabChange!(value),
            tabs:  [
              GButton(
                style: GnavStyle.google,
                icon: Icons.fitness_center_outlined,
                text: ConstantText.MYWORKOUTS[ConstantText.index],
              ),
              GButton(
                icon: Icons.trending_up,
                text: ConstantText.STATISTICS[ConstantText.index],
              ),
              GButton(
                icon: Icons.dvr,
                text: ConstantText.MOVECATALOG[ConstantText.index],
              ),
              GButton(
                icon: Icons.keyboard_double_arrow_up,
                text: ConstantText.HELPER[ConstantText.index],
                backgroundGradient:
                    const LinearGradient(colors: ColorC.premiumGradient),
              ),
            ]),
      ),
    );
  }
}
