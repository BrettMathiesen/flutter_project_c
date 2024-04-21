import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../readdata/get_user_events.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({super.key});

  @override
  State<EventListPage> createState() => EventListPageState();
}

class EventListPageState extends State<EventListPage> {
  String uid = "";

  // document IDs
  List<String> docIDs = [];

// get docIDs
  Future getDocID() async {
    await FirebaseFirestore.instance
        .collection('events')
        .doc(uid)
        .collection('myevents')
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  void initState() {
    //  getDocID();
    super.initState();
    getUID();
    //getDocID();
  }

  getUID() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    setState(() {
      uid = user!.uid;
    });
  }

  logOut(context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Events List",
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 145, 245, 247))),
        actions: [
          GestureDetector(
            onTap: () {
              logOut(context);
            },
            child: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getDocID(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(12),
                     // padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 194, 232, 249),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: ListTile(
                        title: GetUserEvents(documentID: docIDs[index], uid: uid),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
  