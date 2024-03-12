// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/widgets/alertdialogs.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/errormessages.dart';
import 'package:fitnessapp/common/constants/recordtypes.dart';
import 'package:fitnessapp/common/models/modeluser.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseauth.dart';
import 'package:fitnessapp/database/databaseidcount.dart';
import 'package:fitnessapp/database/databaseuser.dart';
import 'package:fitnessapp/presentation/sign/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputResetPasswordValid extends Cubit<bool>
{
  CubitInputResetPasswordValid(): super(false);

  SPChanges spChanges = SPChanges();
  DatabaseUser dbUser = DatabaseUser();
  DatabaseIDCount dbIdCount = DatabaseIDCount();
  DatabaseAuth auth = DatabaseAuth();

  Future<bool> checkValidReset() async {
    if (ResetPassword.mailValid) {
      emit(true);
      return true;
    }
    emit(false);
    return false;
  }

  Future<void> resetPasswordMail(BuildContext context) async {

    await Future<void>.delayed(const Duration(milliseconds: 50));
    ModelUser user = ModelUser.empty();
    bool recentlyLogged = false;

    if(await checkValidReset()){
      try{
        user = await dbUser.findUserByMail((ResetPassword.emailController.text));     // user not found error
        recentlyLogged = await dbUser.findResetLog(ResetPassword.emailController.text);

        if(recentlyLogged){
          throw Exception(ErrorMessages.RESETMAILALREADYSENT);
        }
      }catch(e){
        showDialog(context: context, builder: (context)=> AlertDialogError(ConstantText.RESETMAILSENTFAIL, e.toString()));
        return;
      }
      user.recordType = recordTypes.PASSWORDCHANGE;
      user.recordDate = Timestamp.fromDate(DateTime.now());
      dbUser.insertUserLog(user);
      auth.resetPasswordMail(ResetPassword.emailController.text);
      showDialog(context: context, builder: (context)=>AlertDialogInputOneActionValid(ConstantText.RESETMAILSENT));
    }
    else{
      showDialog(context: context, builder: (context)=> AlertDialogInputOneActionValid(ConstantText.SIGNUPFIELDCHECK));
    }
  }

}