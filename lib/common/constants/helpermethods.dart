import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/constants/constanttext.dart';

class HelperMethods
{
  static String dateToString(DateTime dateTime){
    String temp = "${dateTime.day} "; 

    switch(dateTime.month){
      case 1: temp += ConstantText.JANUARY[ConstantText.index]; break;
      case 2: temp += ConstantText.FEBRUARY[ConstantText.index]; break;
      case 3: temp += ConstantText.MARCH[ConstantText.index]; break;
      case 4: temp += ConstantText.APRIL[ConstantText.index]; break;
      case 5: temp += ConstantText.MAY[ConstantText.index]; break;
      case 6: temp += ConstantText.JUNE[ConstantText.index]; break;
      case 7: temp += ConstantText.JULY[ConstantText.index]; break;
      case 8: temp += ConstantText.AUGUST[ConstantText.index]; break;
      case 9: temp += ConstantText.SEPTEMBER[ConstantText.index]; break;
      case 10: temp += ConstantText.OCTOBER[ConstantText.index]; break;
      case 11: temp += ConstantText.NOVEMBER[ConstantText.index]; break;
      case 12: temp += ConstantText.DECEMBER[ConstantText.index]; break;
      default: temp += ConstantText.DECEMBER[ConstantText.index]; break;
    }

    temp += " ${dateTime.year}";

    return temp;
  }

  static String editDuration(int duration){
    return "$duration ${ConstantText.MINUTES[ConstantText.index]}";
  }
}