import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelexercise.dart';

class DatabaseExercise {
  var refExercise = FirebaseFirestore.instance.collection("EXERCISE");

  void insertExercise(ModelExercise exercise) {
    refExercise.doc().set(exercise.toJson());
  }

  Future<List<ModelExercise>?> getExercisesLast12Hour(int userId) async {
    List<ModelExercise> list = [];
    await refExercise
        .where("userId", isEqualTo: userId)
        .where("recordDate",
            isGreaterThan: Timestamp.fromDate(
                DateTime.now().add(const Duration(hours: -12))))
        .get()
        .then((value) {
      for (var inf in value.docs) {
        list.add(ModelExercise.fromJson(inf.data()));
      }
    });

    if(list.isNotEmpty){
      return list;
    }
    return null;
  }

  Future<List<ModelExercise>> getExercisesAll(int userId) async {
    List<ModelExercise> list = [];
    await refExercise.where("userId", isEqualTo: userId).get().then((value) {
      for (var inf in value.docs) {
        list.add(ModelExercise.fromJson(inf.data()));
      }
    });
    
    return list;
  }
}
