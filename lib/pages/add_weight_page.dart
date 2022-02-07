import 'package:flutter/material.dart';
import 'package:weight_tracker/pages/home_page.dart';

import '../firebase/firestore_repo.dart';

class AddWeight extends StatefulWidget {
  @override
  _AddWeightState createState() => _AddWeightState();
}

class _AddWeightState extends State<AddWeight> {
  TextEditingController weightTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Weight')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    controller: weightTextController,
                    decoration: InputDecoration(labelText: 'Fill Weight'))),
            ElevatedButton(
                onPressed: () {
                  FirestoreRepo().addWeight(weight: weightTextController.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Weight Added')));
                  Navigator.pop(context);
                },
                child: Text('Add Weight'))
          ],
        ),
      ),
    );
  }
}
