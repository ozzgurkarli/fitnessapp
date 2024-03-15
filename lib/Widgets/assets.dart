import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: Sizes.height / 100),
        child: Image.asset(
          'lib/common/assets/animation_loading.gif',
          height: Sizes.height / 15,
          width: Sizes.width / 8,
          fit: BoxFit.fill,
        ));
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/common/assets/logo.png',
      height: Sizes.height / 3.5,
      width: Sizes.height / 3.5,
      fit: BoxFit.fill,
    );
  }
}

class Check extends StatelessWidget {
  const Check({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.height / 100),
      height: Sizes.height / 15,
      width: Sizes.width / 8,
      child: const Icon(
        Icons.check_outlined,
        color: ColorC.foregroundColor,
      ),
    );
  }
}
