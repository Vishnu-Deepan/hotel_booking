import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/custom_colors.dart';

class HotelCardSmall extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final int price;
  final double rating; // This should now represent the average rating
  final int totalRatings; // Total number of ratings

  const HotelCardSmall({
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
    return Card(
      color: CColors.cardColor(context),
      elevation: 1, // Added elevation for better depth perception
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners for the card
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // Rounded corners for the image
                child: Image.asset(imageUrl,
                    width: 160, height: 160, fit: BoxFit.cover),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius:
                      BorderRadius.circular(12), // Sets a circular radius of 24
                ),
                margin: const EdgeInsets.all(3), // Adds margin around the container
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Handle your favorite logic here
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.47,
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Text(' $rating (${totalRatings.toString()} reviews)',
                    style: GoogleFonts.lato(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(title,
                    style: GoogleFonts.lato(
                        fontSize: 19, fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: Colors.blueAccent, size: 20),
                    const SizedBox(width: 4),
                    Text(location, style: GoogleFonts.lato(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Text('₹$price',
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.w700)),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}
