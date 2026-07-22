import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/project_card.dart';
import '../utils/date_format.dart';
import 'project_detail_screen.dart';
import 'exam_detail_screen.dart';
import 'add_card_screen.dart';
import 'pomodoro_screen.dart';
import 'hack_club_status_screen.dart';

class CrewScreen extends StatelessWidget {
  const CrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<ProjectCard>('projects');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cren'),
        actions: [
          IconButton(
            icon: const Icon(Icons.timer_outlined),
            tooltip: 'Pomodoro',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PomodoroScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.rocket_launch_outlined),
            tooltip: 'Hack Club status',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HackClubStatusScreen()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatDate(DateTime.now()),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box<ProjectCard> box, _) {
                  if (box.values.isEmpty) {
                    return const Center(
                      child: Text(
                        'Nothing on your plate yet. Tap + to add something.',
                      ),
                    );
                  }
                  final cards = box.values.toList();
                  return ListView.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, index) =>
                        _CardTile(card: cards[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddCardScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CardTile extends StatelessWidget {
  final ProjectCard card;
  const _CardTile({required this.card});

  @override
  Widget build(BuildContext context) {
    final isExam = card.type == 'exam';
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(card.title),
        subtitle: card.dueDate != null ? Text(formatDate(card.dueDate!)) : null,
        trailing: Icon(
          isExam ? Icons.menu_book_outlined : Icons.rocket_launch_outlined,
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => isExam
                ? ExamDetailScreen(card: card)
                : ProjectDetailScreen(card: card),
          ),
        ),
      ),
    );
  }
}
