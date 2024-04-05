// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/common/constants/pool.dart';
import 'package:fitnessapp/common/constants/size.dart';
import 'package:fitnessapp/common/models/modelprogram.dart';
import 'package:fitnessapp/database/databaseprogram.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CubitProgram extends Cubit<void> {
  CubitProgram() : super(List.empty());

  DatabaseProgram dbProgram = DatabaseProgram();

  void getPrograms(BuildContext context) async {
    http.Response? response = await dbProgram.getProgramsById(Pool.user.id!);

    if (response != null) {
      if (response.statusCode <= 299) {
        for(var item in json.decode(response.body)){
          Pool.programs.add(ModelProgram.fromJson(item));
        }
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
