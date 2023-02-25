import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/models/task_model.dart';
import 'package:realm/realm.dart';

void main() {
  final taskBoard = TaskBoard(Uuid.v4(), '');

  test('getProgress', () {
    final tasks = [
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
    ];

    final progress = TaskCard(taskBoard: taskBoard).getProgress(tasks);
    expect(progress, 0.5);
  });

  test('getProgressText', () {
    final tasks = [
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
    ];

    final numberOfTasks = tasks.length;

    final numberOfCompletedTasks =
        (tasks.where((element) => element.completed)).length;

    final expectedProgressText = '$numberOfCompletedTasks/$numberOfTasks';

    final progressText = TaskCard(taskBoard: taskBoard).getProgressText(tasks);
    expect(progressText, expectedProgressText);
  });
}
