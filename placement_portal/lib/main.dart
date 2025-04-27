import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'screens/registration_form.dart';
import 'screens/placement_statistics.dart';
import 'screens/company_list.dart';
import 'screens/about_us.dart';
import 'screens/profile_page.dart';
import 'screens/login_page.dart';
import 'screens/registration_page.dart';
import 'screens/job_application_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully');
  } catch (e) {
    print('Failed to initialize Firebase: $e');
    // Continue without Firebase for demo purposes
  }

  runApp(const PlacementPortalApp());
}

class PlacementPortalApp extends StatelessWidget {
  const PlacementPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DBIT Placement Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/': (context) => const HomeScreen(),
        '/registration': (context) => const RegistrationForm(),
        '/statistics': (context) => const PlacementStatistics(),
        '/companies': (context) => const CompanyList(),
        '/about': (context) => const AboutUs(),
        '/profile': (context) => const ProfilePage(),
        '/signup': (context) => const RegistrationPage(),
      },
    );
  }
}
