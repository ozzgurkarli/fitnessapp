// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:darq/darq.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modeluser.dart';
import 'package:fitnessapp/database/databaseuser.dart';
import 'package:fitnessapp/presentation/basic/ground.dart';
import 'package:fitnessapp/widgets/customizedwidgets.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/presentation/sign/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CubitWelcomeButton extends Cubit<Widget> {
  CubitWelcomeButton() : super(const ToSignButton());

  void isUserRegistered(BuildContext context) async {
    SPChanges sp = SPChanges();
    String name = await sp.readName();
    if (name == ConstantText.NODATA[0]) {
      emit(const ToSignButton());
    } else {
      DatabaseUser dbUser = DatabaseUser();
      http.Response response = await dbUser.findUser(await sp.readID());
      if (response.statusCode <= 299) {
        Pool.user =ModelUser.fromJson( json.decode(response.body));
        
        emit(const ToHomeButton());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          margin: EdgeInsets.all(Sizes.height / 20),
          content: Align(
              alignment: Alignment.center,
              child: Text(
                  "${ConstantText.SIGNINERROR[ConstantText.index]} + ${response.body}")),
          backgroundColor: ColorC.foregroundColor,
          showCloseIcon: true,
          closeIconColor: ColorC.thirdColor,
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }
}

class ToHomeButton extends StatelessWidget {
  const ToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomizedElevatedButton(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Ground()));
    }, ConstantText.START[ConstantText.index], Icons.keyboard_arrow_right, 0,
        MainAxisAlignment.center);
  }
}

class ToSignButton extends StatelessWidget {
  const ToSignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomizedElevatedButton(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    }, ConstantText.START[ConstantText.index], Icons.keyboard_arrow_right, 0,
        MainAxisAlignment.center);
  }
}
