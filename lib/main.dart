import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'mainscreenpart/iconCollection.dart';
import 'mainscreenpart/lottieanimation.dart';

void main() async {
  // open a box
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

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
          seedColor: const Color(0xFF0F82CE),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text('hearer'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.amber,
            child: const Icon(Icons.camera),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 20,
            height: 50,
            width: 50,
            child: Container(
              padding: const EdgeInsets.all(1),
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
          ),

          Positioned(
            top: 30,
            right: 20,
            height: 50,
            width: 50,
            child: Container(
              padding: const EdgeInsets.all(1),
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: () {},
              ),
            ),
          ),

          Positioned(
            top: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 1,
              child: const Center(
                child: Text(
                  'Snek',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const LottieScreen2(),
          // const SizedBox(height: 30),
          const Positioned(
            bottom: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Part1(),
              ],
            ),
          ),
          // const Part2(),
        ],
      ),
    );
  }
}
