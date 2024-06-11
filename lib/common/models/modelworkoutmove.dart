class ModelWorkoutMove
{
  int? id;
  int? workoutId;
  int? moveId;
  String? moveName;
  String? muscle;
  int? index;
  int? setCount;
  int? repeat;
  double? weight;
  int? duration;

  ModelWorkoutMove(this.muscle, this.index, {this.moveId, this.id, this.workoutId, this.moveName, this.duration, this.repeat, this.setCount, this.weight}): super();

  factory ModelWorkoutMove.fromJson(Map<dynamic, dynamic> json) {
    return ModelWorkoutMove(
        json["muscle"] as String,
        json["index"] as int,
        id: json["id"] as int,
        moveId: json["moveId"] as int,
        workoutId: json["workoutId"] as int,
        moveName: json["moveName"] as String,
        setCount: json["setCount"] as int,
        repeat: json["repeat"] as int,
        weight: json["weight"] as double,);
  }

  Map<String, dynamic> toJson() {
    return {
      "muscle": muscle,
      "index": index,
      "id": id,
      "moveId": moveId,
      "workoutId": workoutId,
      "moveName": moveName,
      "setCount": setCount,
      "repeat": repeat,
      "weight": weight,
      "duration": duration
    };
  }
}