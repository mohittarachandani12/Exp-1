import 'package:flight_app_ui/screens/flightBooking/add_flight.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flight_app_ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase with FirebaseOptions
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCWqIe-ATopQvYMwkx7J4SExj3CRY4H_xs",
      projectId: "flutterflightappui",
      messagingSenderId: "569458172318",
      appId: "1:569458172318:android:06982c555d8c8205daf68f",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
        primaryColor:const  Color(0xff415a5c),
        indicatorColor:const  Color(0xffffcfa1),
        canvasColor:const  Color(0xff9dafb1)
        //canvasColor: const Color(0xff597672),

      ),
      /// SPLASH SCREEN
      home: SplashScreen(),

    );
  }
}
