import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/project_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ProjectCardAdapter());
  Hive.registerAdapter(StepItemAdapter());

  await Hive.openBox<ProjectCard>('projects');

  runApp(const CrenApp());
}

class CrenApp extends StatelessWidget {
  const CrenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cren',
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      home: const CrewScreen(),
    );
  }
}

class CrewScreen extends StatelessWidget {
  const CrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Crew screen goes here')));
  }
}
