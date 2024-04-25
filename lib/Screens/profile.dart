import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking/Screens/edit_profile_page.dart';
import 'package:provider/provider.dart';
import '../themes/custom_colors.dart';
import '../themes/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    // Fetching screen width and height using MediaQuery
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final profileImageSize = screenWidth / 4;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.primaryColor(context).withOpacity(0.6),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Profile Page',
          style: GoogleFonts.dangrek(
            color: Colors.white,
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
              gradient: LinearGradient(
                colors: [
                  CColors.primaryColor(context).withOpacity(0.6),
                  CColors.primaryColor(context)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
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
                    width: profileImageSize,
                    height: profileImageSize,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(4, 0),
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage("https://i.pravatar.cc/56334846"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(profileImageSize / 2),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
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
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "vishnudeepanp@gmail.com",
                            style: GoogleFonts.manrope(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const EditProfilePage(),
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: CColors.overlayColor(context),
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
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

          // BOTTOM Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    _buildOptionRow(
                        context, Icons.bookmark, "Favorites", () {}),
                    _buildOptionRow(
                        context, Icons.payment, "Payment Method", () {}),
                    _buildOptionRow(
                        context, Icons.lock_outline, "Change Password", () {}),
                    _buildOptionRow(
                        context, Icons.privacy_tip, "Privacy Policy", () {}),

                    //theme changer
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        leading: const Icon(Icons.brightness_4),
                        title: const Text("Theme Mode"),
                        trailing: DropdownButton<ThemeMode>(
                          value: themeProvider.themeMode,
                          onChanged: (ThemeMode? newValue) {
                            if (newValue != null) {
                              themeProvider.setThemeMode(newValue);
                            }
                          },
                          items: const [
                            DropdownMenuItem(
                              value: ThemeMode.system,
                              child: Text("System Default"),
                            ),
                            DropdownMenuItem(
                              value: ThemeMode.light,
                              child: Text("Light"),
                            ),
                            DropdownMenuItem(
                              value: ThemeMode.dark,
                              child: Text("Dark"),
                            ),
                          ],
                          underline:
                              Container(), // Optional: to remove underline
                        ),
                      ),
                    ),

                    // Logout button
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Adjust the border radius as needed
                        ),
                        tileColor: CColors.primaryColor(context),
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: _handleLogout,
                      ),
                    ),
                  ],
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionRow(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Container(
      padding:
          const EdgeInsets.all(10), // Adjust padding to change effective height
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
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

  void _handleLogout() {
    // Implement logout functionality here
    // For example, you can navigate to the login page and clear any user session data
  }
}
