import 'package:flutter/material.dart';
import 'package:project_c/pages/soothingpage.dart';

class EmotionsPage extends StatefulWidget {
  final String? situation;
  const EmotionsPage({super.key, required this.situation});

  @override
  State<EmotionsPage> createState() => _EmotionsPageState();
}

class _EmotionsPageState extends State<EmotionsPage> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingController emotionController = TextEditingController();

  String emotionText = "";
  String situationText = "";

  void populateSituation(value) {
    situationText = value;
    print(situationText);
    print('from emotions page');
  }

  @override
  void initState() {
    super.initState();
    populateSituation(widget.situation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          //Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Identify Emotions",
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 145, 245, 247)))),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    children: [
                      TextSpan(
                          text: 'Situation > ',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      TextSpan(
                          text: 'Emotions',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent)),
                      TextSpan(
                          text: ' > Soothing > Actions',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 38.0, left: 25.0, right: 25.0, bottom: 50),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 194, 232, 249),
                  borderRadius: BorderRadius.circular(10.0)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                          "Identify the strongest emotion you are feeling in your body.  Press the button below:",
                          style: TextStyle(fontSize: 16)))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               

                        SizedBox(
                  width: 125,
                  height: 70,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color.fromARGB(255, 181, 174, 255),
                    ),
                    child: const Text("Happy",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
                    onPressed: () {
                      setState(
                        () {
                          emotionText = 'Happy';
                          print(emotionText);
                        },
                      );
                    },
                  ),
                ), 



                
                SizedBox(
                  width: 125,
                  height: 70,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor:
                            const Color.fromARGB(255, 181, 174, 255)),
                    child: const Text("Angry",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
                    onPressed: () {
                      setState(
                        () {
                          emotionText = 'Angry';
                          print(emotionText);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10, height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 125,
                  height: 70,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor:
                            const Color.fromARGB(255, 181, 174, 255)),
                    child: const Text("Sad",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
                    onPressed: () {
                      setState(
                        () {
                          emotionText = 'Sad';
                          print(emotionText);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 125,
                  height: 70,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor:
                            const Color.fromARGB(255, 181, 174, 255)),
                    child: const Text("Guilty",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
                    onPressed: () {
                      setState(
                        () {
                          emotionText = 'Guilty';
                          print(emotionText);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10, height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 125,
                  height: 70,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor:
                            const Color.fromARGB(255, 181, 174, 255)),
                    child: const Text("Afraid",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
                    onPressed: () {
                      setState(
                        () {
                          emotionText = 'Afraid';
                          print(emotionText);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 125,
                  height: 70,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor:
                            const Color.fromARGB(255, 181, 174, 255)),
                    child: const Text("Hurt",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
                    onPressed: () {
                      setState(
                        () {
                          emotionText = 'Hurt';
                          print(emotionText);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10, height: 90),
          ],
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
                  //    Navigator.pushNamed(context, "/summary");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SoothingPage(
                              emotion: emotionText, situation: situationText)));
                },
                child: const Text(
                  "Continue",
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
  }
}
