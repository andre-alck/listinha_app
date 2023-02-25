import 'package:flutter/material.dart';
import 'package:listinha/src/home/widgets/custom_drawer.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/models/task_model.dart';
import 'package:listinha/src/shared/widgets/user_image_button.dart';
import 'package:realm/realm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
                bottom: 100,
              ),
              itemBuilder: (_, index) {
                final taskBoard = TaskBoard(
                  Uuid.v4(),
                  'Tarefita',
                  tasks: [
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
                  ],
                );
                return TaskCard(
                  height: 140,
                  taskBoard: taskBoard,
                );
              },
              separatorBuilder: (_context, index) {
                return Container(height: 10, color: Colors.white);
              },
              itemCount: 100,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(
                      value: 0,
                      label: Text('Todos'),
                    ),
                    ButtonSegment(
                      value: 1,
                      label: Text('Pendentes'),
                    ),
                    ButtonSegment(
                      value: 2,
                      label: Text('Concluídas'),
                    ),
                    ButtonSegment(
                      value: 3,
                      label: Text('Desativadas'),
                    ),
                  ],
                  selected: const {0},
                  onSelectionChanged: (p0) {},
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nova Lista'),
        icon: const Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).pushNamed('/home/edit');
        },
      ),
    );
  }
}
