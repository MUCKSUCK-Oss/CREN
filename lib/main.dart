import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/project_card.dart';
import 'screens/crew_screen.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3DDC97),
      ),
      home: const CrewScreen(),
    );
  }
}
