import 'package:fitnessapp/common/models/modelprogram.dart';
import 'package:fitnessapp/common/models/modeluser.dart';
import 'package:fitnessapp/common/models/modelworkout.dart';

class Pool
{
  static const connectionString = "http://10.0.2.2:5023/api";
  static late ModelUser user;

  static bool programsSearched = false;
  static List<ModelProgram> programs = [];
  
  static bool workoutSearched = false;
  static ModelWorkout lastWorkout = ModelWorkout(-1);
}