import 'package:fitnessapp/common/constants/user.dart';
import 'package:fitnessapp/presentation/basic/ground.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/presentation/sign/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  CubitWelcomeButton extends Cubit<Widget> {
  CubitWelcomeButton() : super(const ToSignButton());

  void isUserRegistered() async {
    SPChanges sp = SPChanges();
    String name = await sp.readName();
    if (name == ConstantText.NODATA[0]) {
      emit(const ToSignButton());
    } else {
      UserC.id = await sp.readID();
      emit(const ToHomeButton());
    }
  }
}

class ToHomeButton extends StatelessWidget {
  const ToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomizedElevatedButton(() {Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Ground()));}, ConstantText.START[ConstantText.index], Icons.keyboard_arrow_right, Sizes.width / 8,MainAxisAlignment.center);
  }
}

class ToSignButton extends StatelessWidget {
  const ToSignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomizedElevatedButton(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    }, ConstantText.START[ConstantText.index], Icons.keyboard_arrow_right, Sizes.width / 8, MainAxisAlignment.center);
  }
}
