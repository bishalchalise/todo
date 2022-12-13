import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:todoapp/widgets/app_input.dart';
import 'package:todoapp/widgets/appbutton.dart';
import 'package:todoapp/widgets/category_selector.dart';
import 'package:todoapp/widgets/date_time_selector.dart';

import '../models/todo_model.dart';

class CreateTodoBottomsheet extends StatefulWidget {
  final Function(Todo) onPressedCreate;

  const CreateTodoBottomsheet({Key? key, required this.onPressedCreate})
      : super(key: key);

  @override
  State<CreateTodoBottomsheet> createState() => _CreateTodoBottomsheetState();
}

class _CreateTodoBottomsheetState extends State<CreateTodoBottomsheet> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String _category = 'personal';
  DateTime? _dateTime;
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, visibility) {
      return SizedBox(
        height: visibility ? 800.0 : null,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'New Task Todo',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2.0,
                height: 40.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Title Task',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppInput(
                    controller: _titleController,
                    isMultiline: false,
                    hintText: 'Add Task Name..',
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CategorySelector(
                    onCategorySelect: (String category) {
                      setState(() {
                        _category = category;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppInput(
                    controller: _descriptionController,
                    isMultiline: true,
                    hintText: 'Add Descriptions..',
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date Time',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DateTimeSelector(
                    onDateTimeSelect: (DateTime dateTime) {
                      setState(() {
                        _dateTime = dateTime;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          value: 'Cancel',
                          border: true,
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: AppButton(
                          color: Colors.blue,
                          value: 'Create',
                          onPressed: () {
                            if (_dateTime != null) {
                              final todo = Todo(
                                title: _titleController.text,
                                description: _descriptionController.text,
                                category: _category,
                                dateTime: _dateTime!,
                              );
                              widget.onPressedCreate(todo);
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
