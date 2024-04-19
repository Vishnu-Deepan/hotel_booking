import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking/Screens/all_images_screen.dart';
import 'package:hotel_booking/Screens/reviews_page.dart';
import 'package:hotel_booking/themes/custom_colors.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({super.key});

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  final List<String> imageUrls = [
    'assets/images/hotel1.jpg',
    'assets/images/hotel2.jpg',
    'assets/images/hotel3.jpg',
    'assets/images/hotel4.jpg',
    'assets/images/hotel5.jpg',
  ];

  final List<String> amenities = [
    "ATM/banking",
    "Valet Parking",
    "Wheelchair",
    "Separate Smoking Area",
    "Lift",
    "Room Service (24 Hours Available)",
    "Special occasion arrangement",
    "ATM at hotel",
    "Wheelchair accessible elevator",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Full Size Image
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/hotel3.jpg',
                        fit: BoxFit.fitHeight,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                CColors.fadeColor(context),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Hotel Name
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 2.0),
                  child: Center(
                    child: Text('Taj Coromandal',
                        style: GoogleFonts.lato(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                  ),
                ),

                //Star Review
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ReviewsPage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBarIndicator(
                            rating: 4.5,
                            itemBuilder: (context, index) =>
                                const Icon(Icons.star, color: Colors.amber),
                            itemCount: 5,
                            itemSize: 25.0,
                            direction: Axis.horizontal,
                          ),
                          const SizedBox(width: 10),
                          Text('4.5', style: GoogleFonts.lato(fontSize: 14)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            Text(
                              "See all Reviews",
                              style: GoogleFonts.lato(
                                color: Colors.blueAccent,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("(200 reviews)",
                                style: GoogleFonts.lato(fontSize: 12)),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),

                //Address
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.red),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '123 Gandhi Nagar, Chennai, Tamil Nadu, India - 600028',
                          style: GoogleFonts.lato(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),

                //Photos
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Photos',
                      style: GoogleFonts.lato(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount:
                        5, // Total count includes 4 images + 1 enhanced "See All" image
                    itemBuilder: (context, index) {
                      if (index < 4) {
                        // Display the first four images
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(imageUrls[index],
                              width: 150, fit: BoxFit.cover),
                        );
                      } else {
                        // Display the "See All" button as the fifth element
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AllImagePage(),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    imageUrls[index], // Display the fifth image
                                    width: 150,
                                    fit: BoxFit.cover),
                              ),
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(
                                      0.5), // Semi-transparent overlay
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text('See All',
                                    style: GoogleFonts.lato(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //Overview
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Overview',
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    ' The Yatra SMART choice property comes with a promise of 8 assured amenities, money-back guarantee and priority helpline support. You also get free cancellation and standardized prices through the year.Sara Hotels and Apartments is roughly 3 km from Angamali Railway Station and 2 km from Thiru Nayathode Siva Narayana Temple. The property in Cochin is a value for money accommodation offering free internet access to its patrons. With its 30 well-kept rooms that are spread over two floors, the property in Cochin offers a decent stay. Available conveniences include bed, makeup mirror, bottled drinking water, ceiling fan and attached bathroom with the facility of hot/cold running water. Some of the rooms have an air-conditioner attached to it.Apart from an accommodation in Cochin, the property is inclusive of a restaurant that serves a selection of delicacies to its patrons. Other facilities include garden, travel counter, 24-hour front desk, backup generator and elevator. There is concierge, security guard and elevator available within the premises. Guests are offered laundry, luggage storage space, room service (limited hour), free airport transfers and medical aid during their stay.Sara Hotels and Apartments is approximately 3 km away from the Cochin International Airport. Nearby points of interest to drop by include Sree Krishna Temple Kalady (7 km) and Periyar River (6 km). ',
                    style: GoogleFonts.lato(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),

                //Amenities
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amenities',
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0, // gap between lines
                        children: amenities
                            .map((amenity) => Chip(
                                  label: Text(amenity,
                                      style: GoogleFonts.lato(
                                          color: CColors.textColor(context))),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),

                //Space at bottom
                const SizedBox(height: 40),
              ],
            ),
          ),
          _buildFixedBar(context),
        ],
      ),
      bottomNavigationBar: _buildFixedBottomBar(context),
    );
  }

  // Fixed App Bar
  Widget _buildFixedBar(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(
          top: statusBarHeight + 10,
          left: statusBarHeight / 4,
          right: statusBarHeight / 4),
      child: SizedBox(
        height: 50, // Fixed bar height
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius:
                    BorderRadius.circular(12), // Sets a circular radius of 24
              ),
              margin:
                  const EdgeInsets.all(3), // Adds margin around the container
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Handle your favorite logic here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Fixed Bottom bAr
  Widget _buildFixedBottomBar(BuildContext context) {
    const double pricePerNight = 2999.99; // Example price
    const String currency = '₹'; // Indian Rupee symbol

    return SafeArea(
      child: BottomAppBar(
        color: CColors.cardColor(context),
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
                      style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CColors.textColor(context)),
                    ),
                    TextSpan(
                      text: '${pricePerNight.toStringAsFixed(2)} ',
                      style: GoogleFonts.lato(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CColors.textColor(context)),
                    ),
                    TextSpan(
                      text: '/ night',
                      style: GoogleFonts.lato(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      CColors.primaryColor(context), // Button text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Squared edges with a slight rounding
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                child: Text(
                  'Book Now',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
