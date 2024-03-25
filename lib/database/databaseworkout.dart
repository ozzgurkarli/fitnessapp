import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/common/models/modelworkout.dart';

class DatabaseWorkout {
  var refWorkout = FirebaseFirestore.instance.collection("WORKOUT");

  void insertExercise(ModelWorkout exercise) {
    refWorkout.doc().set(exercise.toJson());
  }

  Future<List<ModelWorkout>?> getWorkoutsLast12Hour(int userId) async {
    List<ModelWorkout> list = [];
    await refWorkout
        .where("userId", isEqualTo: userId)
        .where("recordDate",
            isGreaterThan: Timestamp.fromDate(
                DateTime.now().add(const Duration(hours: -12))))
        .get()
        .then((value) {
      for (var inf in value.docs) {
        list.add(ModelWorkout.fromJson(inf.data()));
      }
    });

    if(list.isNotEmpty){
      return list;
    }
    return null;
  }

  Future<List<ModelWorkout>> getWorkoutsAll(int userId) async {
    List<ModelWorkout> list = [];
    await refWorkout.where("userId", isEqualTo: userId).get().then((value) {
      for (var inf in value.docs) {
        list.add(ModelWorkout.fromJson(inf.data()));
      }
    });
    
    return list;
  }

  Future<bool> deleteWorkout(int workoutId)async{
    return await refWorkout.where("workoutId", isEqualTo: workoutId).get().then((value) {
      for (var inf in value.docs) {
        refWorkout.doc(inf.id).delete();
      }
      return true;
    });
  }
}
