import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/homeui/homeui.dart';
import 'package:studentapp/login&registration/login_screen.dart';
import 'package:studentapp/pdfconverter/timer.dart';
import 'package:studentapp/podomora%20app/podomora.dart';
import 'package:studentapp/podomora%20app/pwidgets/timerservice.dart';
import 'package:studentapp/screeens/note.dart';
import 'package:studentapp/screeens/planner.dart';

void main() async {
  // open a box
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider<TimerService>(
      create: (_) => TimerService(),
      child: const MyApp(),
    ),
  );
}

DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users");

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 155, 22, 137),
        ),
      ),

      initialRoute: '/',

      // getPages: [
      //   GetPage(name: '/', page: () => const MyHomePage(title: 'Studentapp'),),
      //   GetPage(name: '/planner', page: () => const Notepage() ,),
      //   GetPage(name: '/timer', page: () => const Planner() ,),
      //   GetPage(name: '/timer', page: () => const PodomoraApp() ,),
      //   GetPage(name: '/pdf', page: () => const ImageToPdfList() ,),
      // ],

      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/note': (context) => const Notepage(),
        '/planner': (context) => const Planner(),
        '/timer': (context) => const PodomoraApp(),
        '/pdf': (context) => const ImageToPdfList(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required String title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: user != null ? const HomeUi() : LoginScreen(),
      
    );
  }
}
