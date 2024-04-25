import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({Key? key}) : super(key: key);

  @override
  _MyBookingsPageState createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  int _selectedTabIndex = 0; // Variable to track selected tab index

  List<Map<String, dynamic>> _upcomingBookings = [
    {
      'id': 1,
      'bookingId': '123456',
      'image':'assets/images/hotel1.jpg',
      'checkIn': '2024-04-22',
      'checkOut': '2024-04-24',
      'hotelName': 'Hotel Taj',
      'location': 'Chennai ',
      'ratings': 4.5,
      'reviews': 1234,
    },
    // Add more upcoming bookings as needed
  ];

  List<Map<String, dynamic>> _pastBookings = [
    {
      'id': 1,
      'bookingId': '789012',
      'image':'assets/images/hotel3.jpg',
      'checkIn': '2024-01-02',
      'checkOut': '2024-01-05',
      'hotelName': 'Hotel Green Tree',
      'location': 'Mumbai, India',
      'ratings': 3.2,
      'reviews': 987,
    },
    // Add more past bookings as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16, right: 16, top: 20 + MediaQuery.of(context).padding.top),
            child: Center(
              child: const Text(
                'Bookings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTab('Upcoming', 0),
                _buildTab('Past', 1),
              ],
            ),
          ),
          Expanded(
            child: _selectedTabIndex == 0 ? _buildBookingList(_upcomingBookings) : _buildBookingList(_pastBookings),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: _selectedTabIndex == index ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: _getTabTextColor(index),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildBookingList(List<Map<String, dynamic>> bookings) {
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return _buildBookingItem(bookings[index]);
      },
    );
  }

  Widget _buildBookingItem(Map<String, dynamic> booking) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BOOKING ID: ${booking['bookingId']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Check-in: ${booking['checkIn']}'),
                        Text('Check-out: ${booking['checkOut']}'),
                        const SizedBox(height: 8),
                        Text(
                          '${booking['hotelName']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Theme.of(context).primaryColor),
                            Text('${booking['location']}'),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: booking['ratings'],
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 20,
                              direction: Axis.horizontal,
                            ),
                            // const SizedBox(width: 8),
                            // Text('${booking['ratings']} (${booking['reviews']} Reviews)'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          booking['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCustomButton('Cancel', Colors.grey),
                  _buildCustomButton('View Details', Theme.of(context).primaryColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton(String title, Color color) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Color _getTabTextColor(int index) {
    // Check if the tab is selected
    if (_selectedTabIndex == index) {
      // If selected, return white color regardless of theme brightness
      return Colors.white;
    } else {
      // If not selected, return black color if theme is not dark; otherwise, return white
      return Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black;
    }
  }
}