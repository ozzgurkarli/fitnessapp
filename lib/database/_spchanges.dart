import 'package:fitnessapp/common/constants/constanttext.dart';
import 'package:fitnessapp/database/databaseidcount.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPChanges
{
  DatabaseIDCount databaseIDCount = DatabaseIDCount();

  Future<void> insertData(int id, String name)async{
    var sp = await SharedPreferences.getInstance();

    sp.setInt("ID", id);
    sp.setString("NAME", name);
    sp.setInt("PROGRAMCOUNT", 0);
  }
  
  Future<void> setLanguage(int index)async{
    var sp = await SharedPreferences.getInstance();

    sp.setInt("LANGUAGE", index);
  }

  Future<int> getLanguage()async{
    var sp = await SharedPreferences.getInstance();

    return sp.getInt("LANGUAGE") ?? 0;
  }

  Future<int> readID()async{
    var sp = await SharedPreferences.getInstance();

    return sp.getInt("ID") ?? 0;
  }

  Future<String> readName()async{
    var sp = await SharedPreferences.getInstance();

    return sp.getString("NAME") ?? ConstantText.NODATA[0];
  }
}