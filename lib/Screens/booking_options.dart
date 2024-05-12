import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class BookingOptions extends StatefulWidget {
  final String hotelName;
  final String hotelCity;

  BookingOptions({required this.hotelName, required this.hotelCity});

  @override
  _BookingOptionsState createState() => _BookingOptionsState();
}

class _BookingOptionsState extends State<BookingOptions> {
  late CleanCalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CleanCalendarController(
      onRangeSelected: _onRangeSelected,
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(const Duration(days: 365)),
    );
  }

  void _onRangeSelected(DateTime firstDate, DateTime? secondDate) {
    print('Selected range: $firstDate - $secondDate');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom App Bar with Back Button
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              color: Colors.blue, // Customize the color as needed
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.hotelName, style: TextStyle(fontSize: 16.0, color: Colors.white)),
                      Text(widget.hotelCity, style: TextStyle(fontSize: 14.0, color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Select your preferred dates:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: ScrollableCleanCalendar(
                calendarController: _calendarController,
                layout: Layout.BEAUTY,
                calendarCrossAxisSpacing: 0,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform booking or navigate to the next step
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}