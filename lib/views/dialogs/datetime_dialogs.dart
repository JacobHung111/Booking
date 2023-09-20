import 'package:flutter/material.dart';

class DateTimeDialogs {
  static void showDialogPicker(BuildContext context, String title, int maxDate,
      DateTime? current, Function(DateTime) updateDateTime) {
    showDatePicker(
      context: context,
      helpText: title,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: maxDate)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: Theme.of(context).colorScheme,
          ),
          child: child!,
        );
      },
    ).then((value) {
      if (value == null) return;
      final hour = current?.hour ?? 0;
      final min = current?.minute ?? 0;
      final updated = DateTime(value.year, value.month, value.day, hour, min);
      updateDateTime(updated);
    }, onError: (error) {
      print(error);
    });
  }

  static showDialogTimePicker(BuildContext context, String title,
      DateTime? current, Function(DateTime) updateDateTime) {
    showTimePicker(
      context: context,
      helpText: title,
      initialTime:
          current != null ? TimeOfDay.fromDateTime(current) : TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light()
              .copyWith(colorScheme: Theme.of(context).colorScheme),
          child: child!,
        );
      },
    ).then((value) {
      if (value == null) return;
      final year = current?.year ?? DateTime.now().year;
      final month = current?.month ?? DateTime.now().month;
      final day = current?.day ?? DateTime.now().day;
      final updated = DateTime(year, month, day, value.hour, value.minute);
      updateDateTime(updated);
    }, onError: (error) {
      print(error);
    });
  }
}
