import 'package:flutter/material.dart';

import '../podomora app/putils.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  30, Colors.amber, FontWeight.bold, FontStyle.italic),
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
                Scaffold.of(context).openDrawer();
                // _scaffoldKey.currentState?.openDrawer();
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
    );
  }
}
