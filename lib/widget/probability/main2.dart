import 'package:flutter/material.dart';
import 'package:studentapp/class.dart';
import 'content.dart';

class Probability extends StatelessWidget {
  const Probability({super.key, required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(subject.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_a_photo),
      ),
      body: ListView.builder(
          itemCount: subject.questions?.length,
          itemBuilder: (BuildContext context, int index) {
            final qse = subject.questions![index];
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Imagee(qse)),
                  );
                },
                trailing: const Icon(Icons.check),
                leading: const Icon(Icons.chevron_right),
                title: Text(qse.yearName),
              ),
            );
          }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
