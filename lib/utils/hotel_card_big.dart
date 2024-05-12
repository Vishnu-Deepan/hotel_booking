import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/home_detail_page.dart';
import '../themes/custom_colors.dart';

class HotelCardBig extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final int price;
  final double rating;
  final int totalRatings;

  const HotelCardBig({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.totalRatings,
  });

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 230; // Fixed width
    const double cardHeight = 160; // Fixed height

    return GestureDetector(
        onTap: () {
      // Navigate to the HomeDetailPage when the item is clicked
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeDetailPage(),
        ),
      );
    },
    child: Card(
      color: CColors.cardColor(context),
      elevation: 0.4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(imageUrl, width: cardWidth, height: cardHeight, fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.all(3),
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () {
                    // Handle your favorite logic here
                  },
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Text(' $rating (${totalRatings.toString()} reviews)',
                    style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(title, style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.blueAccent, size: 20),
                    const SizedBox(width: 4),
                    Text(location, style: GoogleFonts.lato(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Text('₹$price', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}