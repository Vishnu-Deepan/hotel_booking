  import 'package:flutter/material.dart';
  import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
  import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
  import 'package:scrollable_clean_calendar/utils/enums.dart';

  class BookingOptionsScreen extends StatefulWidget {
    final String hotelName;
    final String hotelCity;

    BookingOptionsScreen({required this.hotelName, required this.hotelCity});

    @override
    _BookingOptionsScreenState createState() => _BookingOptionsScreenState();
  }

  class _BookingOptionsScreenState extends State<BookingOptionsScreen> {
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

    // Fixed Bottom Bar Widget
    Widget _buildFixedBottomBar(BuildContext context) {
      const double pricePerNight = 2999.99; // Example price
      const String currency = '₹'; // Indian Rupee symbol

      return SafeArea(
        child: BottomAppBar(
          color: Colors.blue, // Background color
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: currency,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text: '${pricePerNight.toStringAsFixed(2)} ',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text: '/ night',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to booking options screen
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => BookingOptionsScreen(
                            hotelName: 'Taj Coromandal', hotelCity: "Chennai"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  child: Text(
                    'Book Now',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "Select Booking Dates",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ScrollableCleanCalendar(
                            calendarController: _calendarController,
                            layout: Layout.BEAUTY,
                            calendarCrossAxisSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildFixedBottomBar(context), // Add Fixed Bottom Bar
      );
    }
  }
