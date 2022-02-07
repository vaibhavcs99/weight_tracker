import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/firebase/firebase_auth.dart';
import 'package:weight_tracker/pages/login_page.dart';

import 'add_weight_page.dart';
import '../firebase/firestore_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                AppAuth().signOutUser();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signed Out')));
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddWeight(),
              )),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirestoreRepo().getWeightCollectionStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index].data();
                  final f = new DateFormat('dd-MMM-yyyy H:mm');

                  return Card(
                    child: ListTile(
                      title: Text(data['weight'].toString()),
                      subtitle: Text(f.format(
                          DateTime.fromMillisecondsSinceEpoch(
                              data['timestamp']))),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
