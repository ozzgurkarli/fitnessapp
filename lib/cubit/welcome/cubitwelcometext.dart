import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/database/_spchanges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitWelcomeText extends Cubit<String>{
  CubitWelcomeText(): super("");

  void isUserRegistered()async{
    
    SPChanges sp = SPChanges();
    String name = await sp.readName(); 
    if(name == ConstantText.NODATA[ConstantText.index]){
      emit(ConstantText.WELCOMEAPPNEW[ConstantText.index]);
    }
    else{
      emit("${ConstantText.WELCOMEAPPOLD[ConstantText.index]}$name.");
    }
  }
}