import 'package:flutter/material.dart';
import 'package:hotel_booking/Screens/home_detail_page.dart';
import 'package:hotel_booking/Screens/search_result.dart';
import '../themes/custom_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<Map<String, dynamic>> hotels = [
    {
      'image': 'assets/images/hotel1.jpg',
      'name': 'Hotel Sunshine',
      'location': 'Sunshine Valley',
      'price': '1500'
    },
    {
      'image': 'assets/images/hotel2.jpg',
      'name': 'Mountain Retreat',
      'location': 'Mountain View',
      'price': '1200'
    },
    // Add more hotels as needed
  ];

  // Sample list of city suggestions
  List<String> citySuggestions = ["Mumbai", "New York", "Tokyo", "London"];

  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredCities with citySuggestions
    filteredCities = citySuggestions;

    _controller.addListener(() {
      final query = _controller.text;
      if (query.isEmpty) {
        setState(() => filteredCities = citySuggestions);
      } else {
        setState(() {
          filteredCities = citySuggestions.where((city) => city.toLowerCase().contains(query.toLowerCase())).toList();
        });
      }
    });

    // Request focus when the state is initialized.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_focusNode.canRequestFocus) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: CColors.searchBarColor(context),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  focusNode: _focusNode,
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search cities or hotels',
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_sharp),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close_sharp),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                  ),
                ),
              ),
            ),
            // GPS button
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.gps_fixed_sharp, color: Colors.blueAccent),
                  SizedBox(width: 7),
                  Text("Or Use My Current Location",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ],
              ),
            ),

            // City suggestions
            Expanded(
              child: _controller.text.isEmpty
                  ? buildHotelList()
                  : ListView(
                children: filteredCities.map((city) => ListTile(
                  title: Text(city),
                  onTap: () {
                    // Navigate to specific hotel's detail page
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchResultPage(cityName: city,),
                      ),
                    );
                  },
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHotelList() {
    return ListView.builder(
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to specific hotel's detail page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeDetailPage(),
              ),
            );
          },
          child: ListTile(
            leading: Image.asset(hotels[index]['image'], fit: BoxFit.cover, width: 80),
            title: Text(hotels[index]['name']),
            subtitle: Text(hotels[index]['location']),
            trailing: Text('₹${hotels[index]['price']}'),
          ),
        );
      },
    );
  }
}