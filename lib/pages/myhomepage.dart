import 'package:flutter/material.dart';
import 'package:project_c/pages/emotionspage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController situationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Situation',
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 145, 245, 247))),
      ),
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
                          text: 'Situation',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent)),
                      TextSpan(
                          text: ' > Emotions > Soothing > Action ',
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 38.0, left: 25.0, right: 25.0, bottom: 70),
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
                          "Describe the situation creating your current mental state:",
                          style: TextStyle(fontSize: 16)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 0.0, left: 25.0, right: 25.0, bottom: 0),
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: situationController,
                maxLength: 100,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Type situation here.",
                  hintText: "State in 100 characters your situation.",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter something valid.";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 182,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color.fromARGB(255, 181, 174, 255)),
                child: const Text("Submit Situation",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("no problems found");
                  }
                  setState(
                    () {
                      print(situationController.text);
                    },
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 30.0, left: 25.0, right: 25.0, bottom: 8),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(situationController.text,
                          style: const TextStyle(fontSize: 16)))
                ],
              ),
            ),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            EmotionsPage(situation: situationController.text)),
                  );
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

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
