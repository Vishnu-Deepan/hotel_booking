import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/home_detail_page.dart';
import '../themes/custom_colors.dart';

class ResultCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final int price;
  final double rating;
  final int totalRatings;

  const ResultCard({
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
    double cardWidth = MediaQuery.of(context).size.width; // Full width

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeDetailPage()));  // Update the constructor as needed
      },
      child: Card(
        color: CColors.cardColor(context),
        elevation: 1,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(imageUrl, width: cardWidth, fit: BoxFit.cover, height: 200),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(title, style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text(location, style: GoogleFonts.lato(fontSize: 14, color: Colors.grey[600])),
                          const SizedBox(height: 10),
                        ],
                      ),
                      Text('₹$price', style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.green[700])),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBarIndicator(
                        rating: rating,
                        itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber,),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(width: 5,),
                      Text('$rating (${totalRatings.toString()} reviews)', style: GoogleFonts.lato(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
