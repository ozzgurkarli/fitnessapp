class ModelMove{
  ModelMove(this.id, this.moveName, this.muscle);

  int id;
  String moveName;
  String muscle;

  factory ModelMove.fromJson(Map<dynamic, dynamic> json) {
    return ModelMove(
        json["id"] as int,
        json["moveName"] as String,
        json["muscle"] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "moveName": moveName,
      "muscle": muscle
    };
  }
}