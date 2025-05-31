import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  final String? initialTitle;
  final String? initialDescription;
  final DateTime? date;
  final TimeOfDay? time;
  final Function(String, String, DateTime, DateTime) onSave;
  final dynamic task;

  const TaskForm({
    Key? key,
    this.initialTitle,
    this.initialDescription,
    this.date,
    this.time,
    required this.onSave,
    this.task,
  }) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.initialTitle ?? widget.task?.title ?? '',
    );
    _descController = TextEditingController(
      text: widget.initialDescription ?? widget.task?.description ?? '',
    );
    _selectedDate = widget.date ?? widget.task?.date ?? DateTime.now();
    _selectedTime =
        widget.time ??
        (widget.task != null
            ? TimeOfDay(
                hour: widget.task.time.hour,
                minute: widget.task.time.minute,
              )
            : TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) setState(() => _selectedDate = picked);
                  },
                  child: Text(
                    'Date: ${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: _selectedTime,
                    );
                    if (picked != null) setState(() => _selectedTime = picked);
                  },
                  child: Text('Time: ${_selectedTime.format(context)}'),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              final dt = DateTime(
                _selectedDate.year,
                _selectedDate.month,
                _selectedDate.day,
                _selectedTime.hour,
                _selectedTime.minute,
              );
              widget.onSave(
                _titleController.text,
                _descController.text,
                _selectedDate,
                dt,
              );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
