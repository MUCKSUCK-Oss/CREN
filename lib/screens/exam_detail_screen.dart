import 'package:flutter/material.dart';
import '../models/project_card.dart';
import '../utils/date_format.dart';

class ExamDetailScreen extends StatefulWidget {
  final ProjectCard card;
  const ExamDetailScreen({super.key, required this.card});

  @override
  State<ExamDetailScreen> createState() => _ExamDetailScreenState();
}

class _ExamDetailScreenState extends State<ExamDetailScreen> {
  late TextEditingController _syllabusController;
  late TextEditingController _videoController;

  @override
  void initState() {
    super.initState();
    _syllabusController = TextEditingController(
      text: widget.card.syllabus ?? '',
    );
    _videoController = TextEditingController(text: widget.card.videoUrl ?? '');
  }

  @override
  void dispose() {
    _syllabusController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final card = widget.card;
    return Scaffold(
      appBar: AppBar(title: Text(card.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (card.dueDate != null)
            Text(
              'Date: ${formatDate(card.dueDate!)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          const SizedBox(height: 24),
          Text('Syllabus', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          TextField(
            controller: _syllabusController,
            maxLines: 6,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'What topics are actually covered',
            ),
            onChanged: (value) {
              card.syllabus = value;
              card.save();
            },
          ),
          const SizedBox(height: 24),
          Text('Video', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          TextField(
            controller: _videoController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Paste a study video link',
            ),
            onChanged: (value) {
              card.videoUrl = value;
              card.save();
            },
          ),
        ],
      ),
    );
  }
}
