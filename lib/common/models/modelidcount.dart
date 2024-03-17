class ModelIDCount
{
  String type;
  int id;

  ModelIDCount(this.type, this.id):super();

  factory ModelIDCount.fromJson(Map<dynamic, dynamic> json) {
    return ModelIDCount(
        json["type"] as String,
        json["id"] as int);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type
    };
  }
}