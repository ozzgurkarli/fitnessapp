import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/idCountTypes.dart';
import 'package:fitnessapp/common/constants/user.dart';
import 'package:fitnessapp/widgets/alertdialogs.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/recordtypes.dart';
import 'package:fitnessapp/common/models/modeluser.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:fitnessapp/database/databaseauth.dart';
import 'package:fitnessapp/database/databaseidcount.dart';
import 'package:fitnessapp/database/databaseuser.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitInputCheckValid extends Cubit<Widget>
{
  CubitInputCheckValid(): super(const Placeholder());
  
  SPChanges spChanges = SPChanges();
  DatabaseUser dbUser = DatabaseUser();
  DatabaseIDCount dbIdCount = DatabaseIDCount();
  DatabaseAuth auth = DatabaseAuth();

  void checkValidSignUp()async{
      if(SignUp.nameValid && SignUp.surnameValid && SignUp.mailValid && SignUp.passwordValid && SignUp.genderValid && SignUp.heightValid && SignUp.birthDateValid && SignUp.kgValid && SignUp.frequencyValid && SignUp.heightController != null){
        await Future<void>.delayed(const Duration(milliseconds: 50));
        if(SignUp.nameController.text.isNotEmpty){
          emit(AlertDialogInputValid(SignUp.nameController.text));
        }
        return;
      }
      await Future<void>.delayed(const Duration(milliseconds: 50));
      emit(AlertDialogInputOneActionValid(ConstantText.FILLALLFIELDS[ConstantText.index]));
  }

  Future<void> insertUser()async{
      await auth.createUser();
      int id = await dbIdCount.getCountAndIncrease(IDCountTypes.userId);
      spChanges.insertData(id, SignUp.nameController.text);
      dbUser.insertUser(ModelUser(id, SignUp.nameController.text, SignUp.surnameController.text, SignUp.emailController.text, SignUp.heightController!.toDouble(), SignUp.kgController!.toDouble(), SignUp.birthDateController.text, SignUp.genderController, SignUp.frequencyController));  
      dbUser.insertUserLog(ModelUser.log(id, SignUp.nameController.text, SignUp.surnameController.text, SignUp.emailController.text, SignUp.heightController!.toDouble(), SignUp.kgController!.toDouble(), SignUp.birthDateController.text, SignUp.genderController, SignUp.frequencyController, recordTypes.SIGNUP, Timestamp.fromDate(DateTime.now())));  
      UserC.id = await spChanges.readID();
  }
}