import 'package:fitnessapp/common/constants/colors.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDropdownHeightItems extends Cubit<List<DropdownMenuItem>> {
  CubitDropdownHeightItems() : super(List<DropdownMenuItem>.empty());

  List<DropdownMenuItem> list = [];
  double value = 0;
  double valueOld = 0;

  void listOfHeights() {
    list.clear();

    for (int i = 130; i < 221; i++) {
      valueOld = value;
      ConstantText.index == 0
          ? value = double.parse((i * 0.0328).toStringAsFixed(1))
          : value = i.toDouble();
      if (valueOld != value) {
        list.add(DropdownMenuItem(
          value: i,
          child: Text(
            "$value ${ConstantText.CM[ConstantText.index]}",
            style: const TextStyle(color: ColorC.textColor),
          ),
        ));
      }
    }

    emit(list);
  }
}
