// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/cubit/signinputs/cubitinputcheckvalid.dart';
import 'package:fitnessapp/presentation/basic/ground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDialogInputValid extends StatelessWidget {
  AlertDialogInputValid(this.name, {super.key});

  String name;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorC.foregroundColor,
      content: Text(
        ConstantText.SIGNUPWANTTOCONTINUE[ConstantText.index],
        style: const TextStyle(color: ColorC.textColor),
      ),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              ConstantText.EDIT[ConstantText.index],
              style: const TextStyle(color: ColorC.textColor),
            )),
        TextButton(
            onPressed: () async {
              bool success = true;
              try {
                await context.read<CubitInputCheckValid>().insertUser();
              } on FirebaseAuthException catch (e) {
                success = false;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  margin: EdgeInsets.all(Sizes.height / 20),
                  content: Align(
                      alignment: Alignment.center,
                      child: Text(ConstantText.SIGNUPERROR[ConstantText.index] +
                          e.code)),
                  backgroundColor: ColorC.foregroundColor,
                  showCloseIcon: true,
                  closeIconColor: ColorC.thirdColor,
                  behavior: SnackBarBehavior.floating,
                ));
              } catch (e) {
                success = false;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  margin: EdgeInsets.all(Sizes.height / 20),
                  content: Align(
                      alignment: Alignment.center,
                      child: Text("${ConstantText.SIGNUPERROR[ConstantText.index]}null")),
                  backgroundColor: ColorC.foregroundColor,
                  showCloseIcon: true,
                  closeIconColor: ColorC.thirdColor,
                  behavior: SnackBarBehavior.floating,
                ));
              }
              if (success) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Ground()));
              }
            },
            child: Text(
              ConstantText.CONTINUE[ConstantText.index],
              style: const TextStyle(color: ColorC.textColor),
            ))
      ],
    );
  }
}
