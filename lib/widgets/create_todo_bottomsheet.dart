import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/widgets/app_input.dart';
import 'package:todoapp/widgets/appbutton.dart';
import 'package:todoapp/widgets/category_selector.dart';
import 'package:todoapp/widgets/date_time_selector.dart';

import '../models/todo_model.dart';

class CreateTodoBottomsheet extends StatefulWidget {
  final Function(Todo, bool) onPressedCreate;
  final Todo? todoToEdit;

  const CreateTodoBottomsheet({
    Key? key,
    required this.onPressedCreate,
    this.todoToEdit,
  }) : super(key: key);

  @override
  State<CreateTodoBottomsheet> createState() => _CreateTodoBottomsheetState();
}

class _CreateTodoBottomsheetState extends State<CreateTodoBottomsheet> {
   String _id = DateTime.now().microsecond.toString();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _category = 'personal';
  DateTime? _dateTime;

  @override
  void initState() {
    super.initState();
    if (widget.todoToEdit != null) {
      _id = widget.todoToEdit!.id;
      _titleController.text = widget.todoToEdit!.title;
      _descriptionController.text = widget.todoToEdit!.description;
      _category = widget.todoToEdit!.category;
      _dateTime = widget.todoToEdit!.dateTime;
    }
  }

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
                    initialCategory: _category,
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
                    initialDateTime: _dateTime,
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
                          value: widget.todoToEdit == null ? 'Create' : 'Edit',
                          onPressed: () {
                            if (_titleController.text == '') {
                              Fluttertoast.showToast(
                                  msg: 'Title Cannot be Empty');
                            } else if (_descriptionController.text == '') {
                              Fluttertoast.showToast(
                                  msg: 'Description cannot be empty');
                            } else if (_dateTime == null) {
                              Fluttertoast.showToast(
                                  msg: 'Date or Time cannot be empty');
                            } else {
                              final todo = Todo(
                                id: _id,
                                title: _titleController.text,
                                description: _descriptionController.text,
                                category: _category,
                                dateTime: _dateTime!,
                                isCompleted: false,
                              );
                              final isEditing = widget.todoToEdit != null;
                              widget.onPressedCreate(todo, isEditing);
                              Navigator.pop(context);
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
