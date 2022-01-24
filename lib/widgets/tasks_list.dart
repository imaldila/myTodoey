import 'package:flutter/material.dart';
import 'package:my_todoey/models/task_data.dart';
import 'package:my_todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TasksList extends StatelessWidget {

  TasksList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: taskData.tasks[index].name!,
            isChecked: taskData.tasks[index].isDone,
            checkboxCallBack: (checkboxState) {
             taskData.updateTask(task);
            },
            onLongPressCallBack: () {
              taskData.deleteTask(task);
            },
          );
        },
        itemCount: taskData.taskCount,
      ),
    );
  }
}
