import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../themes/custom_colors.dart';
import '../themes/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void toggleTheme(BuildContext context) {
    // Implement theme toggle logic here
    // This is just a placeholder function
  }

  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    // Fetching screen width and height using MediaQuery
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.primaryColor(context),
        centerTitle: true,
        title: Text(
          'Profile Page',
          style: GoogleFonts.dangrek(
            color: CColors.cardColor(context),
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          // top blue section
          Container(
            decoration: BoxDecoration(
              color: CColors.primaryColor(context),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            height: screenHeight / 4.5,
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Profile Image
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage("https://i.pravatar.cc/56334846"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  // Name, Email
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vishnu Deepan P",
                            style: GoogleFonts.manrope(
                              color: CColors.cardColor(context),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "vishnudeepanp@gmail.com",
                            style: GoogleFonts.manrope(
                              color: CColors.cardColor(context),
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          //Edit Profile Button
                          // SizedBox(height: 10),  // Space between email and button
                          InkWell(
                            onTap: () {
                              // Handle your button tap here
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: CColors.overlayColor(
                                    context), // Solid color for the button
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Text(
                                "Edit Profile",
                                style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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

          //BOTTOM Section
          Expanded(
            child: ListView(
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  _buildOptionRow(
                      context, Icons.lock_outline, "Change Password", () {}),
                  _buildOptionRow(
                      context, Icons.payment, "Payment Method", () {}),
                  _buildOptionRow(
                      context, Icons.book_online, "My Booking", () {}),
                  _buildOptionRow(
                      context, Icons.privacy_tip, "Privacy Policy", () {}),
                  _buildOptionRowWithSwitch(
                    context,
                    Icons.dark_mode,
                    "Dark Mode",
                    themeProvider. == ThemeMode.dark,
    (value) {
    themeProvider.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    },
                  ),
                ],



              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Container(
      padding: EdgeInsets.all(10), // Adjust padding to change effective height
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
            vertical: 8, horizontal: 16), // Internal padding of ListTile
        leading: Icon(icon,
            size: 24,
            color:
                CColors.textColor(context)), // Icon size can also be adjusted
        title: Text(title, style: GoogleFonts.manrope(fontSize: 16)),
        trailing: Icon(Icons.chevron_right,
            size: 24, color: CColors.textColor(context)),
        onTap: onTap,
      ),
    );
  }

  // for sark mode switch
  Widget _buildOptionRowWithSwitch(BuildContext context, IconData icon,
      String title, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      leading: Icon(icon, color: CColors.textColor(context)),
      title: Text(title, style: GoogleFonts.manrope(fontSize: 16)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: CColors.primaryColor(context),
      ),
      onTap: () {
        onChanged(!value); // Toggle the switch state on row tap as well
      },
    );
  }
}
