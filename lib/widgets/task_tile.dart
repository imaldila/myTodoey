import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskTile extends StatelessWidget {
  bool isChecked = false;
  final String taskTitle;
  final ValueChanged<bool?>? checkboxCallBack;
  final Function()? onLongPressCallBack;

  TaskTile(
      {Key? key,
      required this.taskTitle,
      required this.isChecked,
      required this.checkboxCallBack,
      this.onLongPressCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallBack,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallBack,
      ),
    );
  }
}
