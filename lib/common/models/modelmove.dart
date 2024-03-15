class ModelMove{
  ModelMove(this.moveId, this.moveName);

  int moveId;
  String moveName;

  factory ModelMove.fromJson(Map<dynamic, dynamic> json) {
    return ModelMove(
        json["moveId"] as int,
        json["moveName"] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "moveId": moveId,
      "moveName": moveName,
    };
  }
}