// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/presentation/basic/ground.dart';
import 'package:fitnessapp/widgets/alertdialogs.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/recordtypes.dart';
import 'package:fitnessapp/common/models/modeluser.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseauth.dart';
import 'package:fitnessapp/database/databaseidcount.dart';
import 'package:fitnessapp/database/databaseuser.dart';
import 'package:fitnessapp/presentation/sign/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputSignInValid<T extends Object?> extends Cubit<bool> {
  CubitInputSignInValid() : super(false);

  SPChanges spChanges = SPChanges();
  DatabaseUser dbUser = DatabaseUser();
  DatabaseIDCount dbIdCount = DatabaseIDCount();
  DatabaseAuth auth = DatabaseAuth();

  void checkValidSignIn() async {
    if (SignIn.mailValid && SignIn.passwordValid) {
      emit(true);
      return;
    }
    emit(false);
  }

  Future<void> checkValidSignInHelper(BuildContext context, String email, String password) async {

    if(!SignIn.mailValid || !SignIn.passwordValid){
      showDialog(
          context: context,
          builder: (context) =>
              (AlertDialogError(ConstantText.SIGNINERROR[ConstantText.index], ConstantText.FILLALLFIELDS[ConstantText.index])));
      return;
    }
    String? signInError = await trySignIn(email, password);
    if (signInError == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Ground()),
          (route) => false);
    } else if (signInError == ConstantText.NODATA) {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialogError.empty(ConstantText.SIGNINERROR[ConstantText.index]));
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              (AlertDialogError(ConstantText.SIGNINERROR[ConstantText.index], signInError)));
    }
  }

  Future<String?> trySignIn(String email, String password) async {
    try {
      await auth.signUser(email, password);
      ModelUser user = await dbUser.findUserByMail(email);

      spChanges.insertData(user.id!, user.name!);

      user.recordType = recordTypes.SIGNIN;
      user.recordDate = Timestamp.fromDate(DateTime.now());
      dbUser.insertUserLog(user);
    } on FirebaseAuthException catch (e) {
      return "${e.code}:${e.message}";
    } catch (e) {
      return ConstantText.NODATA[ConstantText.index];
    }

    return null;
  }
}
