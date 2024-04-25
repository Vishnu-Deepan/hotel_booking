import 'package:intl/intl.dart'; // Import the intl package
import 'package:flutter/material.dart';
import '../themes/custom_colors.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();

    void showConfirmationDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            title: Text(
              'Confirmation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CColors.primaryColor(context),
              ),
            ),
            content: Text('Are you sure you want to go back without saving changes ?',
              style: TextStyle(
                fontSize: 16,
                color: CColors.textColor(context),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pop(); // Close the screen
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 16,
                    color: CColors.primaryColor(context),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    color: CColors.textColor(context),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    // Function to show date picke
    Future<void> selectDate(BuildContext context) async {
      final ThemeData theme = Theme.of(context);
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                primary: CColors.primaryColor(context), // Adjust primary color
                onPrimary: Colors.white, // Adjust text color
              ),
              textTheme: theme.textTheme.copyWith(
                titleMedium: TextStyle(color: CColors.textColor(context)), // Adjust text color
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        // Format the selected date to display only the date part
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formattedDate = formatter.format(picked);
        // Set the formatted date in the TextEditingController
        dateController.text = formattedDate;
      }
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // iOS back arrow
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 16,
                  left: 16,
                  bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        color: CColors.textColor(context)),
                    onPressed: () {
                      showConfirmationDialog(context);
                    },
                  ),

                  //Edit Profile
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CColors.textColor(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Profile Image
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey, width: 2),
                      image: const DecorationImage(
                        image: NetworkImage('https://i.pravatar.cc/56334846'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: CColors.cardColor(context).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.edit,
                            color: CColors.primaryColor(context)),
                        onPressed: () {
                          // Handle edit profile image
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Text Input Fields
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon:
                      Icon(Icons.person, color: CColors.textColor(context)),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: CColors.primaryColor(context)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: CColors.primaryColor(context)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      floatingLabelStyle: TextStyle(color: CColors.primaryColor(context)),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon:
                      Icon(Icons.email, color: CColors.textColor(context)),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: CColors.primaryColor(context)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: CColors.primaryColor(context)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      floatingLabelStyle: TextStyle(color: CColors.primaryColor(context)),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      prefixIcon:
                      Icon(Icons.phone, color: CColors.textColor(context)),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: CColors.primaryColor(context)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: CColors.primaryColor(context)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      floatingLabelStyle: TextStyle(color: CColors.primaryColor(context)),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      selectDate(context); // Call function to show date picker
                    },
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: dateController, // Use the TextEditingController
                        onTap: () {
                          selectDate(context); // Call function to show date picker
                        },
                        readOnly: true, // Make the field read-only to prevent manual input
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          prefixIcon: Icon(Icons.calendar_today,
                              color: CColors.textColor(context)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: CColors.primaryColor(context)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: CColors.primaryColor(context)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          floatingLabelStyle: TextStyle(color: CColors.primaryColor(context)),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      prefixIcon: Icon(Icons.person_outline,
                          color: CColors.textColor(context)),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: CColors.primaryColor(context)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: CColors.primaryColor(context)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      floatingLabelStyle: TextStyle(color: CColors.primaryColor(context)),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    value: null,
                    onChanged: (String? newValue) {
                      // Do something
                    },
                    items: <String>['Male', 'Female', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            // Update Profile Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  // Handle update profile
                  _showUpdateConfirmationDialog(context); 
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: CColors.primaryColor(context),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Update Profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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

void _showUpdateConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CColors.primaryColor(context),
          ),
        ),
        content: Text(
          'Are you sure you want to update your profile?',
          style: TextStyle(
            fontSize: 16,
            color: CColors.textColor(context),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _updateProfile(context); // Call function to update profile
            },
            child: Text(
              'Yes',
              style: TextStyle(
                fontSize: 16,
                color: CColors.primaryColor(context),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              'No',
              style: TextStyle(
                fontSize: 16,
                color: CColors.textColor(context),
              ),
            ),
          ),
        ],
      );
    },
  );
}

void _updateProfile(context) {
  Navigator.of(context).pop();
}