import 'package:hive/hive.dart';

part 'project_card.g.dart';

// type is a plain string ("project" or "exam") instead of a Dart enum --
// keeps Hive's generated adapter simple, one less class to register.
@HiveType(typeId: 0)
class ProjectCard extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime? dueDate;

  @HiveField(2)
  List<StepItem> steps;

  @HiveField(3)
  String status; // free-text progress note, shown as "where are you"

  @HiveField(4)
  String type; // "project" or "exam"

  @HiveField(5)
  String? hackClubStatus; // null until you set it -- manual for now, see note below

  @HiveField(6)
  String? syllabus; // exam cards only

  @HiveField(7)
  String? videoUrl; // exam cards only

  ProjectCard({
    required this.title,
    this.dueDate,
    List<StepItem>? steps,
    this.status = "pending",
    this.type = "project",
    this.hackClubStatus,
    this.syllabus,
    this.videoUrl,
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
