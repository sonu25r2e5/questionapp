import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studentapp/homeui/homeui.dart';
import 'package:studentapp/login&registration/LoginScreen.dart';
import 'package:studentapp/podomora%20app/podomora.dart';
import 'package:studentapp/podomora%20app/pwidgets/timerservice.dart';
import 'package:studentapp/screeens/note.dart';
import 'package:studentapp/screeens/planner.dart';
import 'package:studentapp/pdfconverter/timer.dart';
import 'package:provider/provider.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 155, 22, 137),
        ),
      ),
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

  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  // List<Study> study1 = [
  //   Study('Accounting', '20 courses', 'assets/images/acc.png'),
  //   Study('Accounting', '20 courses', 'assets/Icons/student.png'),
  //   Study('Accounting', '20 courses', 'assets/Icons/student.png'),
  //   Study('Accounting', '20 courses', 'assets/Icons/student.png'),
  // ];

  // List text = ['Note', 'To do List', 'Note Taking', 'Pandormora Timer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(20),
      //     child: const SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: Icon(Icons.home),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: user != null ? const HomeUi() : LoginScreen(),
      // body: LoginScreen(),
    );
  }
}

// class notlogin extends StatelessWidget {
//   const notlogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
