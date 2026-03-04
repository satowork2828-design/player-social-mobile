import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api/firebase_api.dart';
import 'screens/home_screen.dart';
import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<FirebaseApi>(
      create: (_) => FirebaseApi(),
      child: MaterialApp(
        title: 'Soccer App',
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
