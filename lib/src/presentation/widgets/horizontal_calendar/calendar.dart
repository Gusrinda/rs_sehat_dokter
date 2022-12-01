import 'package:flutter/material.dart';

import 'calendar_button.dart';
import 'calendar_items.dart';

typedef OnDateSelected = void Function(DateTime date);

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({
    Key? key,
    required this.date,
    this.initialDate,
    this.lastDate,
    this.textColor,
    this.backgroundColor,
    this.selectedColor,
    required this.onDateSelected,
  }) : super(key: key);

  final DateTime date;
  final DateTime? initialDate /*!*/;
  final DateTime? lastDate /*!*/;
  final Color? textColor /*!*/;
  final Color? backgroundColor /*!*/;
  final Color? selectedColor /*!*/;
  final OnDateSelected onDateSelected;

  @override
  State<HorizontalCalendar> createState() => _CalendarState();
}

class _CalendarState extends State<HorizontalCalendar> {
  late DateTime _startDate;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    selectedDate = widget.date;
  }

  @override
  Widget build(BuildContext context) {
    _startDate = selectedDate.subtract(const Duration(days: 3));

    return Container(
      height: 72,
      color: widget.backgroundColor ?? Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CalendarItems(
                  index: index,
                  startDate: _startDate,
                  initialDate: widget.initialDate ?? DateTime.now(),
                  selectedDate: selectedDate,
                  textColor: widget.textColor ?? Colors.black45,
                  selectedColor:
                  widget.selectedColor ?? Theme.of(context).primaryColor,
                  backgroundColor: widget.backgroundColor ?? Colors.white,
                  onDatePressed: () =>
                      onDatePressed(index, widget.initialDate),
                );
              },
            ),
          ),
          CalendarButton(
            textColor: widget.textColor ?? Colors.black45,
            backgroundColor: widget.backgroundColor ?? Colors.white,
            onCalendarPressed: () async {
              DateTime? date = await selectDate();
              if (date != null) {
                widget.onDateSelected(date);
                setState(() => selectedDate = date);
              }
            },
          ),
        ],
      ),
    );
  }

  Future<DateTime?> selectDate() async {
    return await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: selectedDate,
      firstDate: widget.initialDate ?? DateTime.now(),
      lastDate: widget.lastDate ?? DateTime.now().add(const Duration(days: 90)),
    );
  }

  void onDatePressed(int index, DateTime? initialDate) {
    DateTime date = _startDate.add(Duration(days: index));
    int checkDate =
        date.difference(widget.initialDate ?? DateTime.now()).inDays;
    if (checkDate >= 0) {
      widget.onDateSelected(date);
      setState(() {
        selectedDate = _startDate.add(Duration(days: index));
        _startDate = _startDate.add(Duration(days: index));
      });
    }
  }
}
