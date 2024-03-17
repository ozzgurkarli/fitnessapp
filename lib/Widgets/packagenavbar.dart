// ignore_for_file: must_be_immutable

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding:
            EdgeInsets.only(top: Sizes.height / 40, bottom: Sizes.height / 40),
        child: GNav(
            tabBackgroundGradient:
                const LinearGradient(colors: ColorC.defaultGradient),
            color: Colors.white,
            activeColor: Colors.white,
            mainAxisAlignment: MainAxisAlignment.center,
            tabBorderRadius: 30,
            onTabChange: (value) => onTabChange!(value),
            tabs:  [
              GButton(
                icon: Icons.fitness_center_outlined,
                text: ConstantText.MYWORKOUTS[ConstantText.index],
              ),
              GButton(
                icon: Icons.trending_up,
                text: ConstantText.STATISTICS[ConstantText.index],
              ),
              GButton(
                icon: Icons.power_settings_new,
                text: ConstantText.CATALOG[ConstantText.index],
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
