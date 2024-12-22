import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'providers/recipe_provider.dart';
import 'screens/home_screen.dart';
import 'screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBQ3s3dlGiQljDOvdz616VMucyP-vaypnc",
      appId: "1:868004384032:android:51d21ce734386d4575db45",
      messagingSenderId: "868004384032",
      projectId: "projet-ded24",
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recette App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // HomeScreen will be conditionally loaded based on authentication status
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if the user is signed in
    final user = FirebaseAuth.instance.currentUser;

    // If the user is signed in, navigate to the HomeScreen
    if (user != null) {
      return HomeScreen();
    }

    // Otherwise, show the SignInScreen
    return const SignInScreen();
  }
}
