
// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
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
      content: Text(ConstantText.SIGNUPWANTTOCONTINUE[ConstantText.index], style: TextStyle(color: ColorC.backgroundColor),),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              ConstantText.EDIT[ConstantText.index],
              style: TextStyle(color: ColorC.backgroundColor),
            )),
        TextButton(
            onPressed: () async{
              bool success = true;
              try{
                await context.read<CubitInputCheckValid>().insertUser();
              }
              on FirebaseAuthException catch(e){
                success = false;
                  showDialog(context: context, builder: (context) => AlertDialogError(ConstantText.SIGNUPERROR[ConstantText.index], e.code));
              }
              catch(e){
                success = false;
                  showDialog(context: context, builder: (context) => AlertDialogError.empty(ConstantText.SIGNUPERROR[ConstantText.index]));
              }
              if(success){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Ground()));
              }
            },
            child: Text(
              ConstantText.CONTINUE[ConstantText.index],
              style: TextStyle(color: ColorC.backgroundColor),
            ))
      ],
    );
  }
}

class AlertDialogInputOneActionValid extends StatelessWidget {
  AlertDialogInputOneActionValid(this.labelText, {super.key});

  String labelText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorC.foregroundColor,
      content: Text(labelText, style: const TextStyle(color: ColorC.backgroundColor),),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              ConstantText.OK[ConstantText.index],
              style: TextStyle(color: ColorC.backgroundColor),
            )),
      ],
    );
  }
}

class AlertDialogError extends StatelessWidget {
  AlertDialogError(this.message, this.errorMessage, {super.key});
  AlertDialogError.empty(this.message, {super.key});

  String message;
  String errorMessage = "null";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorC.foregroundColor,
      content: Text(message + errorMessage, style: const TextStyle(color: ColorC.backgroundColor),),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              ConstantText.OK[ConstantText.index],
              style: TextStyle(color: ColorC.backgroundColor),
            )),
      ],
    );
  }
}