import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  TextEditingController dateRangeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateRangeController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date picker"),
        leading: const Icon(Icons.calendar_today),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              DateTimeRange? pickedDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
                initialDateRange: DateTimeRange(
                  start: DateTime.now(),
                  end: DateTime.now().add(const Duration(days: 7)),
                ),
              );
              if (pickedDateRange != null) {
                String formattedDateRange = DateFormat("yyyy-MM-dd")
                        .format(pickedDateRange.start)
                        .toString() +
                    " to " +
                    DateFormat("yyyy-MM-dd")
                        .format(pickedDateRange.end)
                        .toString();

                setState(() {
                  dateRangeController.text = formattedDateRange;
                });
              } else {
                print("Not selected");
              }
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: TextField(
            controller: dateRangeController,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            onTap: () async {
              DateTimeRange? pickedDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
                initialDateRange: DateTimeRange(
                  start: DateTime.now(),
                  end: DateTime.now().add(const Duration(days: 7)),
                ),
              );
              if (pickedDateRange != null) {
                String formattedDateRange = DateFormat("yyyy-MM-dd")
                        .format(pickedDateRange.start)
                        .toString() +
                    " to " +
                    DateFormat("yyyy-MM-dd")
                        .format(pickedDateRange.end)
                        .toString();

                setState(() {
                  dateRangeController.text = formattedDateRange;
                });
              } else {
                print("Not selected");
              }
            },
          ),
        ),
      ),
    );
  }
}
