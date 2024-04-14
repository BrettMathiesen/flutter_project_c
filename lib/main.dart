import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';
import 'package:project_c/pages/authscreen.dart';
import './pages/splashpage.dart';
import './pages/disclaimerpage.dart';
import './pages/situationpage.dart';
import './pages/emotionspage.dart';
import './pages/soothingpage.dart';
import './pages/actionpage.dart';
import './pages/summarypage.dart';
import './pages/eventlistpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health Check',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        scaffoldBackgroundColor: Color.fromARGB(255, 237, 237, 237),
        fontFamily: 'Poppins',
        useMaterial3: true,
       // brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
     //   brightness: Brightness.light,
      ),
      initialRoute: '/login',
      routes: {
        '/login': ((context) => const AuthScreen()),
        '/splash': ((context) => const SplashPage()),
        '/disclaimer': ((context) => const DisclaimerPage()),
        '/situation': ((context) => const SituationPage()),
        //  '/home' : ((context) => const MyHomePage( )),
        //  '/identify' : ((context) => const IdentifyPage(situation: '' )),
        '/emotions': ((context) => const EmotionsPage(situation: '')),
        '/soothing': ((context) =>
            const SoothingPage(emotion: '', situation: '')),
        '/action': ((context) => const ActionPage(emotion: '', situation: '')),
        '/summary': ((context) =>
            const SummaryPage(action: '', emotion: '', situation: '')),
         '/events': ((context) => const EventListPage()),   
      },
      //home: const MyHomePage(title: 'Flutter Example App'),
      debugShowCheckedModeBanner: false,
    );
  }
}
