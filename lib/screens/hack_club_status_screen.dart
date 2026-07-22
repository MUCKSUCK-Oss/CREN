import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/project_card.dart';

class HackClubStatusScreen extends StatelessWidget {
  const HackClubStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ProjectCard>('projects');

    return Scaffold(
      appBar: AppBar(title: const Text('Hack Club status')),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<ProjectCard> box, _) {
          final submitted = box.values
              .where(
                (c) => c.hackClubStatus != null && c.hackClubStatus!.isNotEmpty,
              )
              .toList();

          if (submitted.isEmpty) {
            return const Center(
              child: Text(
                "Nothing submitted yet -- set a status from a project's detail screen.",
              ),
            );
          }

          return ListView.builder(
            itemCount: submitted.length,
            itemBuilder: (context, index) {
              final card = submitted[index];
              return ListTile(
                title: Text(card.title),
                trailing: Chip(label: Text(card.hackClubStatus!)),
              );
            },
          );
        },
      ),
    );
  }
}
