import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/apirequest/scrrens/home_screen.dart';
import 'package:studentapp/bottomiconbarwidgets/homepagewidget.dart';
import 'package:studentapp/bottomiconbarwidgets/setting.dart';
import 'package:studentapp/login&registration/LoginScreen.dart';
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
    // final Map<String, WidgetBuilder> routes = {
    //   '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
    //   '/note': (context) => const Notepage(),
    //   '/planner': (context) => const Planner(),
    //   '/timer': (context) => const PodomoraApp(),
    //   '/pdf': (context) => const ImageToPdfList(),
    // };

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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
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

          const details(),

          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.2,
          //   left: MediaQuery.of(context).size.width * 0.25,
          //   child: Center(
          //     child: Text(
          //       'Smart Desk',
          //       style: textStyle(
          //           30, Colors.amber, FontWeight.bold, FontStyle.italic),
          //     ),
          //   ),
          // ),

          // Positioned(
          //   bottom: MediaQuery.of(context).size.height * .1,
          //   left: MediaQuery.of(context).size.width * 0.2,
          //   child: const Text(
          //     '\n"Unleash your \n academic Potential"',
          //     style: TextStyle(
          //       fontStyle: FontStyle.italic,
          //       fontSize: 22,
          //     ),
          //   ),
          // ),

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
                  // Scaffold.of(context).openDrawer();
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
          ),
          // GridView.builder(
          //     padding: const EdgeInsets.all(100),
          //     itemCount: 6,

          //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //       childAspectRatio: 3 / 2,
          //       maxCrossAxisExtent: 200,
          //       mainAxisSpacing: 30,
          //       crossAxisSpacing: 40,
          //     ),
          //     itemBuilder: (BuildContext context, int) {
          //       return Container(
          //         decoration: const BoxDecoration(
          //           color: Colors.brown,
          //           // shape: BoxShape.circle,
          //           backgroundBlendMode: BlendMode.difference,
          //         ),
          //         child: const Text('hi asas'),
          //       );
          //     }),

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
        items: [
          const BottomNavigationBarItem(
            backgroundColor: Colors.white70,
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
                              Colors.green.withOpacity(
                                0.5,
                              ),
                              Colors.blue.withOpacity(
                                0.5,
                              )
                            ],
                          ),
                        ),
                        height: 800,
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
                                  Colors.white.withOpacity(0.2),
                                  Colors.green.withOpacity(0.6),
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chats',
          // ),
        ],
      ),
    );
  }
}
