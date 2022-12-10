import 'package:flutter/material.dart';

class DateTimeSelector extends StatefulWidget {
  const DateTimeSelector({Key? key}) : super(key: key);

  @override
  State<DateTimeSelector> createState() => _DateTimeSelectorState();
}

class _DateTimeSelectorState extends State<DateTimeSelector> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final currentTIme = TimeOfDay.now();
    final firstDate = currentDate.subtract(const Duration(
      days: 3650,
    ));
    final lastDate = currentDate.add(const Duration(
      days: 3650,
    ));

    return Container(
      padding: const EdgeInsets.all(
        10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _itemBuilder(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: firstDate,
                  lastDate: lastDate,
                );
                setState(() {
                  _selectedDate = pickedDate;
                });
              },
              value: _selectedDate == null
                  ? 'Date'
                  : '${_selectedDate?.year}/${_selectedDate?.month}/${_selectedDate?.day}',
              icon: Icon(
                Icons.calendar_month_rounded,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: _itemBuilder(
              onPressed: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: currentTIme,
                );
                setState(() {
                  _selectedTime = pickedTime;
                });
              },
              value: _selectedTime == null
                  ? 'Time'
                  : '${_selectedTime?.hour}:${_selectedTime?.minute}',
              icon: Icon(
                Icons.access_time_rounded,
                color: Colors.grey.shade500,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemBuilder({
    required final String value,
    required final Icon icon,
    required final Function()? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 10.0,
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
