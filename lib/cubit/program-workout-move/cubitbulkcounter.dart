import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitBulkCounter extends Cubit<String>
{
  CubitBulkCounter(): super("0 ${ConstantText.KG[ConstantText.index]}");
  
  void currentBulk(int bulk, int addWeight){
    emit("${bulk+addWeight} ${ConstantText.KG[ConstantText.index]}");
  }
}