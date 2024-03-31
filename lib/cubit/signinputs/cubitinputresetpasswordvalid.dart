// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/size.dart';
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

class CubitInputResetPasswordValid extends Cubit<bool> {
  CubitInputResetPasswordValid() : super(false);

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

  Future<void> resetPasswordMail(BuildContext context, String email) async {
    await Future<void>.delayed(const Duration(milliseconds: 50));
    ModelUser user = ModelUser.empty();
    bool recentlyLogged = false;

    if (await checkValidReset()) {
      try {
        user = await dbUser.findUserByMail((email)); // user not found error
        recentlyLogged = await dbUser.findResetLog(email);

        if (recentlyLogged) {
          throw Exception(ErrorMessages.RESETMAILALREADYSENT);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          margin: EdgeInsets.all(Sizes.height / 20),
          content: Align(
              alignment: Alignment.center,
              child: Text(ConstantText.RESETMAILSENTFAIL[ConstantText.index] +
                  e.toString())),
          backgroundColor: ColorC.foregroundColor,
          showCloseIcon: true,
          closeIconColor: ColorC.thirdColor,
          behavior: SnackBarBehavior.floating,
        ));
        return;
      }
      
      auth.resetPasswordMail(email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(Sizes.height / 20),
        content: Align(
            alignment: Alignment.center,
            child: Text(ConstantText.RESETMAILSENT[ConstantText.index])),
        backgroundColor: ColorC.foregroundColor,
        showCloseIcon: true,
        closeIconColor: ColorC.thirdColor,
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(Sizes.height / 20),
        content: Align(
            alignment: Alignment.center,
            child: Text(ConstantText.FILLALLFIELDS[ConstantText.index])),
        backgroundColor: ColorC.foregroundColor,
        showCloseIcon: true,
        closeIconColor: ColorC.thirdColor,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
