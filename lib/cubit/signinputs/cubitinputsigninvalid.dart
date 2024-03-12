// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/widgets/alertdialogs.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/recordtypes.dart';
import 'package:fitnessapp/common/models/modeluser.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseauth.dart';
import 'package:fitnessapp/database/databaseidcount.dart';
import 'package:fitnessapp/database/databaseuser.dart';
import 'package:fitnessapp/presentation/home.dart';
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

  Future<T?> checkValidSignInHelper(BuildContext context) async {
    await Future<void>.delayed(const Duration(milliseconds: 50));
    String? signInError = await trySignIn();
    if (signInError == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
          (route) => false);
    } else if (signInError == ConstantText.NODATA) {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialogError.empty(ConstantText.SIGNINERROR));
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              (AlertDialogError(ConstantText.SIGNINERROR, signInError)));
    }
    return null;
  }

  Future<String?> trySignIn() async {
    try {
      await auth.signUser();
      ModelUser user = await dbUser.findUserByMail(SignIn.emailController.text);

      spChanges.insertData(user.id!, user.name!);

      user.recordType = recordTypes.SIGNIN;
      user.recordDate = Timestamp.fromDate(DateTime.now());
      dbUser.insertUserLog(user);
    } on FirebaseAuthException catch (e) {
      return "${e.code}:${e.message}";
    } catch (e) {
      return ConstantText.NODATA;
    }

    return null;
  }
}
