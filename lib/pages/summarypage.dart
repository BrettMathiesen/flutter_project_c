import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SummaryPage extends StatefulWidget {
  final String? action;
  final String? situation;
  final String? emotion;
  const SummaryPage({super.key, this.action, this.emotion, this.situation});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final _formKey = GlobalKey<FormState>();

  addEventToFirebase(
    String? situation1,
    String? emotion1,
    String? action1,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    final uid = user?.uid;

    var time = DateTime.now();

    await FirebaseFirestore.instance
        .collection('events')
        .doc(uid)
        .collection('myevents')
        .doc(time.toString())
        .set({
      'situation': situation1,
      'emotion': emotion1,
      'action': action1,
      'time': time.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text("Summary",
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 145, 245, 247)))),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 35.0, left: 20.0, right: 8.0, bottom: 0),
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Situation:',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, left: 25.0, right: 25.0, bottom: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 194, 232, 249),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(("${widget.situation}"),
                            style: TextStyle(fontSize: 16)))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 15.0, left: 20.0, right: 8.0, bottom: 0),
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Emotion:',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, left: 25.0, right: 25.0, bottom: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 194, 232, 249),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text("${widget.emotion}",
                            style: TextStyle(fontSize: 16)))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 15.0, left: 20.0, right: 8.0, bottom: 0),
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Action:',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, left: 25.0, right: 25.0, bottom: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 194, 232, 249),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text("${widget.action}",
                            style: TextStyle(fontSize: 16)))
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 182,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Color.fromARGB(255, 181, 174, 255)),
                  onPressed: () {
                    addEventToFirebase(
                        widget.situation, widget.emotion, widget.action);
                  },
                  child: const Text(
                    "Upload Summary",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.deepPurpleAccent),
                onPressed: () {
                  Navigator.pushNamed(context, "/events");
                },
                child: const Text(
                  "Continue to List",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 231, 246, 243)),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
