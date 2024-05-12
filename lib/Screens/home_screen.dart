import 'package:flutter/material.dart';
import 'package:hotel_booking/Screens/profile.dart';
import 'package:hotel_booking/themes/custom_colors.dart';
import 'package:hotel_booking/utils/hotel_card_small.dart';
import '../utils/hotel_card_big.dart';
import 'bookings_screen.dart';
import 'search.dart';
import 'search_result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    // Fetching screen width and height using MediaQuery
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_sharp), label: "My Bookings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: CColors.primaryColor(context),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        backgroundColor: CColors.cardColor(context),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                // top blue section
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CColors.primaryColor(context).withOpacity(0.6),
                          CColors.primaryColor(context)
                        ]),
                    color: CColors.primaryColor(context),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  height: screenHeight / 4,
                  width: screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).padding.top / 3,
                        ),

                        // SizedBox(height: screenWidth*0.2,),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(height: screenWidth*0.2,),
                            Icon(
                              Icons.menu_sharp,
                              color: Colors.white,
                              size: 40,
                            ),

                            Expanded(
                              child: Center(
                                child: Text(
                                  "UrTripO",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Search Bar
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SearchPage(),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: CColors.overlayColor(context)
                                      .withOpacity(0.6),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                ),
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.07,
                                child: const Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      "Search",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Image scroll section
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(5, (index) => imageTile(context,index)),
                  ),
                ),

                // Best hotels section
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Hotels",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),

                // Best Hotel cards section
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => HotelCardBig(
                              imageUrl:
                                  'assets/images/hotel${index + 1}.jpg', // Assuming image names like hotel1.jpg, hotel2.jpg, etc.
                              title: 'Hotel ${index + 1}',
                              location: 'Location ${index + 1}',
                              price: 100 * (index + 1),
                              rating: (index % 5) + 1.0,
                              totalRatings: (index + 1) * 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Nearby your locations
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hotels Nearby",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),

                //Nearby Hotel Cards
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: List.generate(
                            5,
                            (index) => HotelCardSmall(
                              imageUrl: 'assets/images/hotel${index + 1}.jpg',
                              title: 'Hotel ${index + 1}',
                              location: 'Location ${index + 1}',
                              price: 100 * (index + 1),
                              rating: (index % 5) + 1.0,
                              totalRatings: (index + 1) * 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const MyBookingsPage(),
          const ProfilePage(),
        ],
      ),
    );
  }

  Widget imageTile(BuildContext context, int index) {
    final List<String> assetPaths = [
      'assets/images/image1.jpg',
      'assets/images/image2.jpg',
      'assets/images/image3.jpg',
      'assets/images/image4.jpg',
      'assets/images/image5.jpg',
    ];

    final List<String> imageTitles = [
      'Mumbai',
      'Chennai',
      'Goa',
      'Kochi',
      'Bengaluru',
    ];

    return Padding(
      padding: const EdgeInsets.all(13),
      child: GestureDetector(
        onTap: () {
          String cityName = imageTitles[index];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResultPage(cityName: cityName),
            ),
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                assetPaths[index],
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              imageTitles[index],
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }


}
