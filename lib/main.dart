import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/themes/custom_colors.dart';
import 'package:provider/provider.dart';
import 'Screens/home_screen.dart';
import 'themes/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: const MyApp(),
  ),);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: CColors.darkCard,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);


    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,

      home: const HomePage(),
    );
  }
}
