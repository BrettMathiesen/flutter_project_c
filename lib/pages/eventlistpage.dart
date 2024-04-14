import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import '../read data/get_user_name.dart';

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
    await FirebaseFirestore.instance.collection('Events').get().then(
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
            child: Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(child: CircularProgressIndicator());
          } else {
            final docs = snapshot.data!.docs;

            return GridView.custom(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1 / .4),
                childrenDelegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 194, 232, 249),
                        borderRadius: BorderRadius.circular(10),
                      //  border: Border.all(color: Colors.black),
                      ),
                      padding: const EdgeInsets.all(5.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 194, 232, 249),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(2),
                              child: Wrap(
                                children: [
                                  Text('Situation:  ' +
                                      docs[index]['situation']),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 194, 232, 249),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(2),
                              child: Row(
                                children: [
                                  Text('Emotion:  ' + docs[index]['emotion']),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 194, 232, 249),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(2),
                              child: Wrap(
                                children: [
                                  Text('Action:  ' + docs[index]['action']),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                }, childCount: docs.length));
          }
        },
        stream: FirebaseFirestore.instance
            .collection('events')
            .doc(uid)
            .collection('myevents')
            .snapshots(),
      ),
    );
  }
  //  )childCount: docs.length;

  //      return ListView.builder(
  //          itemBuilder: ((context, index) {
  //            return ListTile(
  //              title: Text(docs[index]['situation']),
  //              subtitle: Text(docs[index]['emotion']),
  //            );
  //          }),
  //          itemCount: docs.length);
}
        
       

/*
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('signed in as: ' + '${[User]}'),
              Expanded(
                child: FutureBuilder(
                  future: getDocID(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              //      title: Text(docIDs[index]),
                              title: GetUserName(documentID: docIDs[index]),
                              tileColor: Colors.grey[200],
                              ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
*/
  
