// ignore_for_file: empty_catches, use_build_context_synchronously

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/presentation/basic/ground.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/models/modeluser.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseauth.dart';
import 'package:fitnessapp/database/databaseidcount.dart';
import 'package:fitnessapp/database/databaseuser.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:fitnessapp/widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CubitInputCheckValid extends Cubit<Widget> {
  CubitInputCheckValid() : super(const Placeholder());

  SPChanges spChanges = SPChanges();
  DatabaseUser dbUser = DatabaseUser();
  DatabaseIDCount dbIdCount = DatabaseIDCount();
  DatabaseAuth auth = DatabaseAuth();

  void checkValidSignIn(
      BuildContext context, String mail, String password) async {
    if (mail.split('@').length > 1 &&
        mail.split('.').length > 1 &&
        password.length == 6) {
      await Future<void>.delayed(const Duration(milliseconds: 50));
      showDialog(
        context: context,
        builder: (context) => const Center(child: Loading()),
      );

      bool success = true;
      success = await loginUser(context, mail, password);

      if (success) {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Ground()),
            (route) => false);
      } 
    }
    else{
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

  void checkValidSignUp(BuildContext context) async {
    if (SignUp.nameController.text.length > 1 &&
        SignUp.surnameController.text.length > 1 &&
        SignUp.emailController.text.split('@').length > 1 &&
        SignUp.emailController.text.split('.').length > 1 &&
        SignUp.passwordController.text.length == 6 &&
        SignUp.genderController != null &&
        SignUp.birthDateController.text.length > 1) {
      showDialog(
        context: context,
        builder: (context) => const Center(child: Loading()),
      );

      if (SignUp.nameController.text.isNotEmpty) {
        bool success = true;
        success = await insertUser(context);

        if (success) {
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Ground()),
              (route) => false);
        }
      }
      return;
    }
    else{
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

  Future<bool> loginUser(
      BuildContext context, String mail, String password) async {
    try {
      await auth.signUser(mail, password);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(Sizes.height / 20),
        content: Align(
            alignment: Alignment.center,
            child: Text(ConstantText.SIGNINERROR[ConstantText.index] + e.code)),
        backgroundColor: ColorC.foregroundColor,
        showCloseIcon: true,
        closeIconColor: ColorC.thirdColor,
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(Sizes.height / 20),
        content: Align(
            alignment: Alignment.center,
            child: Text("${ConstantText.SIGNINERROR[ConstantText.index]}null")),
        backgroundColor: ColorC.foregroundColor,
        showCloseIcon: true,
        closeIconColor: ColorC.thirdColor,
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    }

    http.Response response = await dbUser.loginUser(ModelUser(
        0,
        SignUp.nameController.text,
        SignUp.surnameController.text,
        SignUp.emailController.text,
        SignUp.birthDateController.text,
        SignUp.genderController,
        SignUp.invitationCodeController.text));

    if (response.statusCode <= 299) {
      Pool.user = ModelUser.fromJson(json.decode(response.body));
    } else {
      Navigator.pop(context);
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
      return false;
    }

    if (Pool.user.id == null) {
      Navigator.pop(context);
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
      return false;
    }

    return true;
  }

  Future<bool> insertUser(BuildContext context) async {
    try {
      await auth.createUser();
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(Sizes.height / 20),
        content: Align(
            alignment: Alignment.center,
            child: Text(ConstantText.SIGNUPERROR[ConstantText.index] + e.code)),
        backgroundColor: ColorC.foregroundColor,
        showCloseIcon: true,
        closeIconColor: ColorC.thirdColor,
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    } catch (e) {
      Navigator.pop(context);
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
      return false;
    }

    http.Response response = await dbUser.insertUser(ModelUser(
        0,
        SignUp.nameController.text,
        SignUp.surnameController.text,
        SignUp.emailController.text,
        SignUp.birthDateController.text,
        SignUp.genderController,
        SignUp.invitationCodeController.text));

    if (response.statusCode <= 299) {
      Pool.user = ModelUser.fromJson(json.decode(response.body));
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.all(Sizes.height / 20),
        content: Align(
            alignment: Alignment.center,
            child: Text(
                "${ConstantText.SIGNUPERROR[ConstantText.index]} + ${response.body}")),
        backgroundColor: ColorC.foregroundColor,
        showCloseIcon: true,
        closeIconColor: ColorC.thirdColor,
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    }

    spChanges.insertData(Pool.user.id!, SignUp.nameController.text);

    return true;
  }
}
