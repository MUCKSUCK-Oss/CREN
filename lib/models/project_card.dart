import 'package:hive/hive.dart';

part 'project_card.g.dart';

@HiveType(typeId: 0)
class ProjectCard extends HiveObject {
  @HiveField(0)
  String title; // "Rankin", "Physics Exam", "Debate Arena"

  @HiveField(1)
  DateTime? dueDate;

  @HiveField(2)
  List<StepItem> steps;

  @HiveField(3)
  String status; // "pending", "in progress", "done" — or Hack Club status later

  ProjectCard({
    required this.title,
    this.dueDate,
    List<StepItem>? steps,
    this.status = "pending",
  }) : steps = steps ?? [];
}

@HiveType(typeId: 1)
class StepItem extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  bool done;

  StepItem({required this.description, this.done = false});
}
