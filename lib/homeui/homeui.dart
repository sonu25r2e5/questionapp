import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/apirequest/screens/home_screen.dart';
import 'package:studentapp/bottomiconbarwidgets/homepagewidget.dart';
import 'package:studentapp/bottomiconbarwidgets/setting.dart';
import 'package:studentapp/login&registration/login_screen.dart';
import 'package:studentapp/mainscreenpart/classee.dart';
// import '../podomora app/putils.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    List<Testwee> tee = [
      const Testwee('Question Paper', Icons.note, '/note'),
      const Testwee('Planner', Icons.task_rounded, '/planner'),
      const Testwee('ClockTimer', Icons.timer, '/timer'),
      const Testwee('Pdf Capture', Icons.picture_as_pdf, '/pdf')
    ];
    return Scaffold(
      key: _scaffoldKey,
      drawer: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: Drawer(
          // backgroundColor: Colors.blue.withOpacity(0.8),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName:
                    Text(FirebaseAuth.instance.currentUser?.displayName ?? ''),
                accountEmail:
                    Text(FirebaseAuth.instance.currentUser?.email ?? ''),
                currentAccountPicture: const CircleAvatar(
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
              ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.logout),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 1,
            // width: MediaQuery.of(context).size.height * 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/book2.jpg'),
                // fit: BoxFit.cover,
              ),
            ),
          ),
          // main screen of the app is detail .
          const Details(),
          Positioned(
            top: screenHeight * 0.08,
            right: 20,
            height: screenHeight * 0.05,
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
            top: screenHeight * 0.08,
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
                  // Scaffold.of(context).openDrawer();
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.play_circle_fill_outlined),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  context: context,
                  builder: (BuildContext context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 1.8,
                        sigmaY: 1.8,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(
                                0.9,
                              ),
                              Colors.white24.withOpacity(
                                0.6,
                              )
                            ],
                          ),
                        ),
                        height: screenHeight * 0.8,
                        child: const Videoplayerscreen(),
                      ),
                    );
                  },
                );
              },
            ),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.blue.withOpacity(0.1),
                      context: context,
                      builder: (BuildContext context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 1.8,
                            sigmaY: 1.9,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(
                                    0.9,
                                  ),
                                  Colors.white24.withOpacity(
                                    0.6,
                                  ),
                                ],
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            height: 500,
                          ),
                        );
                      });
                },
              ),
              label: "home"),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    context: context,
                    builder: (BuildContext context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 1.8,
                          sigmaY: 1.9,
                        ),
                        child: const Setting(),
                      );
                    });
              },
            ),
            label: 'Camera',
          ),
        ],
      ),
    );
  }
}
