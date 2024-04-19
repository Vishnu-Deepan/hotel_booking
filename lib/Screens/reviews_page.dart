import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/review_card.dart';

class Review {
  final String imageUrl;
  final String name;
  final String date;
  final double rating;
  final String reviewText;

  Review({
    required this.imageUrl,
    required this.name,
    required this.date,
    required this.rating,
    required this.reviewText,
  });
}

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  List<Review> reviews = [
    Review(
        imageUrl: 'https://i.pravatar.cc/150',
        name: 'User 1',
        date: '2023-04-18',
        rating: 4.5,
        reviewText:
            'This is a sample review text number 1. More detailed feedback can be placed here.'),
    Review(
        imageUrl: 'https://i.pravatar.cc/510',
        name: 'User 2',
        date: '2023-04-18',
        rating: 2.0,
        reviewText: 'Negative feedback example here.'),
    Review(
        imageUrl: 'https://i.pravatar.cc/30',
        name: 'User 1',
        date: '2023-04-18',
        rating: 3.4,
        reviewText:
        'This is a sample review text number 1. More detailed feedback can be placed here.'),
    Review(
        imageUrl: 'https://i.pravatar.cc/500',
        name: 'User 1',
        date: '2023-04-18',
        rating: 1.5,
        reviewText:
        'This is a sample review text number 1. More detailed feedback can be placed here.'),

  ];

  String sortOption = 'Positive First';

  void sortReviews() {
    if (sortOption == 'Positive First') {
      reviews.sort((a, b) => b.rating.compareTo(a.rating));
    } else {
      reviews.sort((a, b) => a.rating.compareTo(b.rating));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Reviews",
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.sort_sharp),
              onSelected: (String value) {
                setState(() {
                  sortOption = value;
                  sortReviews();
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Positive First',
                  child: Text('Positive First'),
                ),
                const PopupMenuItem<String>(
                  value: 'Negative First',
                  child: Text('Negative First'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header Reviews
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "3.7",
                      style: GoogleFonts.hanuman(
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                      ),
                    ),
                    Column(
                      children: [
                        RatingBarIndicator(
                          rating: 4.7,
                          itemBuilder: (context, index) =>
                              const Icon(Icons.star, color: Colors.amber),
                          itemCount: 5,
                          itemSize: 25.0,
                          direction: Axis.horizontal,
                        ),
                        Text(
                          "200 Reviews",
                          style: GoogleFonts.gafata(
                            // fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),


            //All Review Details
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: reviews
                    .map((review) => ReviewCard(
                          imageUrl: review.imageUrl,
                          name: review.name,
                          date: review.date,
                          rating: review.rating,
                          reviewText: review.reviewText,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
