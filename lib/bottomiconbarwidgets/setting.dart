import 'package:flutter/material.dart';

class Subject {
  String settings;
  IconData icondata;
  Subject(this.settings, this.icondata);
}

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    List<Subject> listdata = [
      Subject("Account", Icons.account_circle),
      Subject("Downloads", Icons.download),
      Subject("Purchase & memberships", Icons.shop),
      Subject("Time watched", Icons.timelapse),
      Subject("Help", Icons.help),
    ];

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.white.withOpacity(0.6),
        Colors.white24.withOpacity(0.2),
      ])),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 16,
              ),
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              itemCount: listdata.length,
              padding: const EdgeInsets.all(20),

              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listdata[index].settings,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Icon(listdata[index].icondata),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
