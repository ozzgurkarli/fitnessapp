class ModelProgramMove
{
  int? programId;
  int? moveId;
  String? moveName;
  String? muscle;
  int? index;

  ModelProgramMove(this.muscle, this.index, {this.moveId, this.programId, this.moveName}): super();
  ModelProgramMove.empty();

  factory ModelProgramMove.fromJson(Map<dynamic, dynamic> json) {
    return ModelProgramMove(
        json["muscle"] as String,
        json["index"] as int,
        moveId: json["moveId"] as int,
        programId: json["programId"] as int,
        moveName: json["moveName"] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "muscle": muscle,
      "index": index,
      "moveId": moveId,
      "programId": programId,
      "moveName": moveName
    };
  }
}