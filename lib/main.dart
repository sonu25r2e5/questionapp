import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:studentapp/mainscreenpart/classee.dart';
import 'package:studentapp/podomora%20app/podomora.dart';
import 'package:studentapp/podomora%20app/putils.dart';
import 'package:studentapp/screeens/note.dart';
import 'package:studentapp/screeens/planner.dart';
import 'package:studentapp/timer/timer.dart';

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
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey)),
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // List<Study> study1 = [
  //   Study('Accounting', '20 courses', 'assets/images/acc.png'),
  //   Study('Accounting', '20 courses', 'assets/Icons/student.png'),
  //   Study('Accounting', '20 courses', 'assets/Icons/student.png'),
  //   Study('Accounting', '20 courses', 'assets/Icons/student.png'),
  // ];

  // List text = ['Note', 'To do List', 'Note Taking', 'Pandormora Timer'];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<Testwee> tee = [
      const Testwee('Note', Icons.note, '/note'),
      const Testwee('Planner', Icons.task_rounded, '/planner'),
      const Testwee('ClockTimer', Icons.timer, '/timer'),
      const Testwee('Pdf Capture', Icons.picture_as_pdf, '/pdf')
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Stee.co'),
              accountEmail: Text('sk7018059@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/Icons/student.png'),
              ),
            ),
            ...List.generate(
              tee.length,
              (index) {
                return ListTile(
                  // tileColor: Theme.of(context).colorScheme.secondary,

                  onTap: () {
                    Navigator.of(context).pushNamed(tee[index].routeName);
                  },
                  title: Text(tee[index].text),
                  contentPadding: const EdgeInsets.all(2),
                  trailing: Icon(tee[index].iconData),
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
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

      body: Stack(
        fit: StackFit.loose,
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/images/book2.jpg'),
              // fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.25,
            child: Center(
              child: Text(
                'Smart Desk',
                style: textStyle(
                  30,
                  Colors.amber,
                  FontWeight.bold,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * .1,
            left: MediaQuery.of(context).size.width * 0.1,
            child: const Text(
              '"Unleash your academic Potential"',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 23,
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
                icon: const Icon(Icons.notification_add),
                onPressed: () {},
              ),
            ),
          ),

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

          // const SizedBox(height: 30),
          // const Positioned(
          //   bottom: 0,
          //   child: Stack(
          //     clipBehavior: Clip.none,
          //     children: [
          //       Part1(),
          //     ],
          //   ),
          // ),
          // const Part2(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white70,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_outlined),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Whislist',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Camera',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chats',
          // ),
        ],
      ),
    );
  }
}
