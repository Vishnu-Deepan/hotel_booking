import 'package:flutter/material.dart';
import 'package:hotel_booking/themes/custom_colors.dart';
import 'package:hotel_booking/utils/bottom_modal.dart';
import 'package:hotel_booking/utils/result_card.dart';
import '../utils/filter_button.dart';

class SearchResultPage extends StatefulWidget {
  final String cityName;
  const SearchResultPage({super.key, required this.cityName});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  String selectedSort = '';
  List<Map<String, dynamic>> hotels = [
    {
      'imageUrl': 'assets/images/hotel1.jpg',
      'title': 'Hotel C',
      'location': 'Location 1',
      'price': 300,
      'rating': 4.5,
      'totalRatings': 200,
    },
    {
      'imageUrl': 'assets/images/hotel2.jpg',
      'title': 'Hotel A',
      'location': 'Location 2',
      'price': 450,
      'rating': 4.8,
      'totalRatings': 180,
    },
    {
      'imageUrl': 'assets/images/hotel3.jpg',
      'title': 'Hotel B',
      'location': 'Location 3',
      'price': 220,
      'rating': 3.9,
      'totalRatings': 120,
    },
  ];

  void sortHotels(String sortType) {
    setState(() {
      selectedSort = sortType;
      if (sortType == 'priceDesc') {
        hotels.sort((a, b) => b['price'].compareTo(a['price']));
      } else if (sortType == 'priceAsc') {
        hotels.sort((a, b) => a['price'].compareTo(b['price']));
      } else if (sortType == 'rating') {
        hotels.sort((a, b) => b['rating'].compareTo(a['rating']));
      } else if (sortType == 'popularity') {
        hotels.sort((a, b) => b['totalRatings'].compareTo(a['totalRatings']));
      } else if (sortType == 'nameAsc') {
        hotels.sort((a, b) => a['title'].compareTo(b['title']));
      } else if (sortType == 'nameDesc') {
        hotels.sort((a, b) => b['title'].compareTo(a['title']));
      } else if (sortType == 'lowestRating') {
        hotels.sort((a, b) => a['rating'].compareTo(b['rating']));
      }
    });
    Navigator.pop(context);
  }

  // Filter Modals
  void sortModal() {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return CustomBottomModal(
          child: Column(
            children: [
              _buildListItem(
                context,
                title: Text(selectedSort.isEmpty ? "Sort" : getSortTitle(selectedSort)),
                borderColor: selectedSort.isEmpty ? Colors.transparent : Colors.blue,
                leading: const Icon(Icons.trending_down),
                onTap: () => sortHotels('priceDesc'),
              ),
              _buildListItem(
                context,
                title: Text(selectedSort.isEmpty ? "Price Low to High" : getSortTitle(selectedSort)),
                borderColor: selectedSort.isEmpty ? Colors.transparent : Colors.blue,
                leading: const Icon(Icons.trending_up),
                onTap: () => sortHotels('priceAsc'),
              ),
              _buildListItem(
                context,
                title: Text(selectedSort.isEmpty ? "Highest Rating" : getSortTitle(selectedSort)),
                borderColor: selectedSort.isEmpty ? Colors.transparent : Colors.blue,
                leading: const Icon(Icons.star),
                onTap: () => sortHotels('rating'),
              ),
              _buildListItem(
                context,
                title: Text(selectedSort.isEmpty ? "Lowest Rating" : getSortTitle(selectedSort)),
                borderColor: selectedSort.isEmpty ? Colors.transparent : Colors.blue,
                leading: const Icon(Icons.star_border),
                onTap: () => sortHotels('lowestRating'),
              ),
              _buildListItem(
                context,
                title: Text(selectedSort.isEmpty ? "Most Popular" : getSortTitle(selectedSort)),
                borderColor: selectedSort.isEmpty ? Colors.transparent : Colors.blue,
                leading: const Icon(Icons.people),
                onTap: () => sortHotels('popularity'),
              ),
              _buildListItem(
                context,
                title: Text(selectedSort.isEmpty ? "Name - Ascending" : getSortTitle(selectedSort)),
                borderColor: selectedSort.isEmpty ? Colors.transparent : Colors.blue,
                leading: const Icon(Icons.sort_by_alpha),
                onTap: () => sortHotels('nameAsc'),
              ),
              _buildListItem(
                context,
                title: Text(selectedSort.isEmpty ? "Name - Descending" : getSortTitle(selectedSort)),
                borderColor: selectedSort.isEmpty ? Colors.transparent : Colors.blue,
                leading: const Icon(Icons.sort_by_alpha),
                onTap: () => sortHotels('nameDesc'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListItem(BuildContext context, {required Text title, required Icon leading, required Function onTap, required Color borderColor}) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            leading,
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: title),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back_ios_outlined),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  Text(
                    widget.cityName,
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterButton(
                    onTap: () {
                      sortModal();
                    },
                    title: "Sort",
                    icon: Icons.sort_rounded,
                    borderColor: selectedSort.isEmpty ? Colors.transparent : CColors.primaryColor(context),
                  ),
                  FilterButton(
                    onTap: () {},
                    title: "Locality",
                    icon: Icons.location_city_outlined,
                    borderColor: Colors.transparent,
                  ),
                  FilterButton(
                    onTap: () {},
                    title: "Price",
                    icon: Icons.currency_rupee, borderColor: Colors.transparent,
                  ),
                  FilterButton(
                    onTap: () {},
                    title: "Amenities",
                    icon: Icons.list, borderColor: Colors.transparent,
                  ),

                  //clear all filters
                  FilterButton(
                    onTap: () {},
                    title: "Clear Filters",
                    icon: Icons.clear_all_rounded, borderColor: Colors.redAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 9),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    hotels.length,
                        (index) {
                      var hotel = hotels[index];
                      return Padding(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                        child: ResultCard(
                          imageUrl: hotel['imageUrl'],
                          title: hotel['title'],
                          location: hotel['location'],
                          price: hotel['price'],
                          rating: hotel['rating'],
                          totalRatings: hotel['totalRatings'],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getSortTitle(String sortType) {
  switch (sortType) {
    case 'priceDesc':
      return 'Price High to Low';
    case 'priceAsc':
      return 'Price Low to High';
    case 'rating':
      return 'Highest Rated';
    case 'popularity':
      return 'Most Popular';
    case 'nameAsc':
      return 'Name A-Z';
    case 'nameDesc':
      return 'Name Z-A';
    case 'lowestRating':
      return 'Lowest Rated';
    default:
      return 'Sort';
  }
}
