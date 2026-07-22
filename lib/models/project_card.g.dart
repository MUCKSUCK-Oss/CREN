// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectCardAdapter extends TypeAdapter<ProjectCard> {
  @override
  final int typeId = 0;

  @override
  ProjectCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectCard(
      title: fields[0] as String,
      dueDate: fields[1] as DateTime?,
      steps: (fields[2] as List?)?.cast<StepItem>(),
      status: fields[3] as String,
      type: fields[4] as String,
      hackClubStatus: fields[5] as String?,
      syllabus: fields[6] as String?,
      videoUrl: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProjectCard obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.dueDate)
      ..writeByte(2)
      ..write(obj.steps)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.hackClubStatus)
      ..writeByte(6)
      ..write(obj.syllabus)
      ..writeByte(7)
      ..write(obj.videoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StepItemAdapter extends TypeAdapter<StepItem> {
  @override
  final int typeId = 1;

  @override
  StepItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StepItem(description: fields[0] as String, done: fields[1] as bool);
  }

  @override
  void write(BinaryWriter writer, StepItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.done);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
