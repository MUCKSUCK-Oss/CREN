import 'package:flutter/material.dart';
import '../models/project_card.dart';

class ProjectDetailScreen extends StatefulWidget {
  final ProjectCard card;
  const ProjectDetailScreen({super.key, required this.card});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  late TextEditingController _whereController;

  @override
  void initState() {
    super.initState();
    _whereController = TextEditingController(text: widget.card.status);
  }

  @override
  void dispose() {
    _whereController.dispose();
    super.dispose();
  }

  Future<void> _addStep() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add a step'),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Add'),
          ),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() {
        widget.card.steps.add(StepItem(description: result.trim()));
        widget.card.save();
      });
    }
  }

  Future<void> _setHackClubStatus() async {
    final controller = TextEditingController(
      text: widget.card.hackClubStatus ?? '',
    );
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set status'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Pending, Shipped, Rejected...',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (result != null) {
      setState(() {
        widget.card.hackClubStatus = result.trim().isEmpty
            ? null
            : result.trim();
        widget.card.save();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final card = widget.card;
    return Scaffold(
      appBar: AppBar(title: Text(card.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Where are you', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          TextField(
            controller: _whereController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            onChanged: (value) {
              card.status = value;
              card.save();
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'What you will do next',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(icon: const Icon(Icons.add), onPressed: _addStep),
            ],
          ),
          ...card.steps.map(
            (step) => CheckboxListTile(
              title: Text(step.description),
              value: step.done,
              onChanged: (value) {
                setState(() {
                  step.done = value ?? false;
                  card.save();
                });
              },
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Hack Club status',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _setHackClubStatus,
            child: Chip(
              label: Text(card.hackClubStatus ?? 'Tap to set status'),
            ),
          ),
        ],
      ),
    );
  }
}
