class ModelProgramMove
{
  int? programId;
  int? moveId;
  String? moveName;
  String? muscle;
  int? repeat;
  double? weight;
  int? duration;
  int? index;

  ModelProgramMove(this.muscle, this.index, {this.moveId, this.programId, this.moveName, this.weight, this.repeat, this.duration}): super();
  ModelProgramMove.empty();
}