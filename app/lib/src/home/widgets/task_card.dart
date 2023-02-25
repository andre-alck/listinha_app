import 'package:flutter/material.dart';
import 'package:listinha/src/shared/services/models/task_model.dart';

enum TaskCardStatus {
  pending(iconData: Icons.access_time, text: 'Pendente'),
  completed(iconData: Icons.check, text: 'Completa'),
  disabled(iconData: Icons.cancel_outlined, text: 'Desativada');

  final IconData iconData;
  final String text;

  const TaskCardStatus({required this.iconData, required this.text});
}

class TaskCard extends StatelessWidget {
  final TaskBoard taskBoard;
  final double height;
  const TaskCard({super.key, required this.taskBoard, required this.height});

  double getProgress(List<Task> tasks) {
    if (tasks.isEmpty) {
      return 0;
    }
    final tasksCompleted = tasks.where((element) => element.completed);
    final progress = tasksCompleted.length / tasks.length;
    return progress;
  }

  String getProgressText(List<Task> tasks) {
    final tasksCompleted = tasks.where((element) => element.completed);
    final progressText = '${tasksCompleted.length}/${tasks.length}';
    return progressText;
  }

  TaskCardStatus getStatus(TaskBoard board, double progress) {
    if (!board.enabled) {
      return TaskCardStatus.disabled;
    }

    if (progress < 1) {
      return TaskCardStatus.pending;
    }

    return TaskCardStatus.completed;
  }

  Color getBackgroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiaryContainer;

      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;

      case TaskCardStatus.disabled:
        return theme.colorScheme.errorContainer;
    }
  }

  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiary;

      case TaskCardStatus.pending:
        return theme.colorScheme.primary;

      case TaskCardStatus.disabled:
        return theme.colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final title = taskBoard.title;
    final progress = getProgress(taskBoard.tasks);
    final progressText = getProgressText(taskBoard.tasks);
    final status = getStatus(taskBoard, progress);
    final backgroundColor = getBackgroundColor(status, theme);
    final color = getColor(status, theme);
    final statusText = status.text;
    final iconData = status.iconData;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: theme.iconTheme.color?.withOpacity(0.5),
              ),
              const Spacer(),
              Text(
                statusText,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (taskBoard.tasks.isNotEmpty)
            Column(
              children: [
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  color: color,
                  value: progress,
                ),
                const SizedBox(height: 2),
                Text(
                  progressText,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
