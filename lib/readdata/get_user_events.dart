import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import '../pages/eventlistpage.dart';
//import 'package:flutter/rendering.dart';

class GetUserEvents extends StatelessWidget {
  final String documentID;
  final String uid;

  GetUserEvents({required this.documentID, required this.uid});

  @override
  Widget build(BuildContext context) {
    CollectionReference event = FirebaseFirestore.instance
        .collection('events')
        .doc(uid)
        .collection('myevents');

    return FutureBuilder<DocumentSnapshot>(
        future: event.doc(documentID).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                //
                //

                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Situation:  ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "${data['situation']}"),
                    ],
                  ),
                ),
                

                //
                //
                ////

                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Emotion:  ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "${data['emotion']}"),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Action:  ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "${data['action']}"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //  IconButton(
                    //      icon: Icon(Icons.settings),
                    //         onPressed: () {},
                    //        ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('events')
                            .doc(uid)
                            .collection('myevents')
                            .doc(data['time'])
                            .delete();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            );
          }
          return Text('loading');
        }));
  }
}
