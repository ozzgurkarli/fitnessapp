import 'package:fitnessapp/common/models/modelmove.dart';
import 'package:fitnessapp/database/databasemove.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitMove extends Cubit<List<ModelMove>>
{
  CubitMove():super(List.empty());

  DatabaseMove dbMove = DatabaseMove();

  void getMovesByMuscle(String muscleName)async{
    emit(await dbMove.getMovesByMuscle(muscleName));
  }
}