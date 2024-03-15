import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCreateProgramScreenProperties extends Cubit<List<List<String>>>
{
  CubitCreateProgramScreenProperties(): super(List.empty());


  List<List<String>> muscleNameList = [];

  void setProperties(){

    muscleNameList.clear();

    fillMuscleNameList();
    emit(muscleNameList);
  }

  void fillMuscleNameList(){
    muscleNameList.add(ConstantText.CHEST);
    muscleNameList.add(ConstantText.SHOULDER);
    muscleNameList.add(ConstantText.BACK);
    muscleNameList.add(ConstantText.BICEPS);
    muscleNameList.add(ConstantText.TRICEPS);
    muscleNameList.add(ConstantText.LEG);
    muscleNameList.add(ConstantText.ABDOMEN);
    muscleNameList.add(ConstantText.CARDIO);
  }
}