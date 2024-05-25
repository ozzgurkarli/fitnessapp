import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitBulkCounter extends Cubit<String>
{
  CubitBulkCounter(): super("0 ${ConstantText.KG[ConstantText.index]}");
  
  void currentBulk(double bulk){
    emit("$bulk ${ConstantText.KG[ConstantText.index]}");
  }
}