class ModelIDCount
{
  int emptyColumn;
  int id;

  ModelIDCount(this.emptyColumn, this.id):super();

  factory ModelIDCount.fromJson(Map<dynamic, dynamic> json) {
    return ModelIDCount(
        json["emptyColumn"] as int,
        json["id"] as int);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "emptyColumn": emptyColumn
    };
  }
}