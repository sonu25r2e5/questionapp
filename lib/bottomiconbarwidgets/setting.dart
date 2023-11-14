import 'package:flutter/material.dart';

class subject {
  String settings;
  IconData icondata;
  subject(this.settings, this.icondata);
}

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    List<subject> listdata = [
      subject("Account", Icons.account_circle),
      subject("Downloads", Icons.download),
      subject("Purchase and memberships", Icons.shop),
      subject("Time watched", Icons.timelapse),
      subject("Help", Icons.help),
    ];

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.white.withOpacity(0.6),
        Colors.green.withOpacity(0.2),
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
