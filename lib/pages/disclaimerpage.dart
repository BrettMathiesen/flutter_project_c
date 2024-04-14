import 'package:flutter/material.dart';

class DisclaimerPage extends StatefulWidget {
  const DisclaimerPage({
    super.key,
  });
  @override
  State<DisclaimerPage> createState() => _DisclaimerPageState();
}

class _DisclaimerPageState extends State<DisclaimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Disclaimer',
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 145, 245, 247))),
      ),
      backgroundColor: Color.fromARGB(255, 220, 246, 250),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 0.0, left: 40.0, right: 40.0, bottom: 40),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 220, 246, 250)),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                        "This app is for a brief mental health check only.  If you are in crisis or you think you may have an emergency, call your doctor or 911 immediately. If you're having suicidal thoughts, call 1-800-273-TALK (8255) to talk to a skilled, trained counselor at a crisis center in your area at any time (National Suicide Prevention Lifeline). If you are located outside the United States, call your local emergency line immediately.  "
                        "You must establish a relationship with a licensed mental health provider outside of the application.",
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 220, 246, 250),
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
                  Navigator.pushNamed(context, "/situation");
                },
                child: const Text(
                  "Agree to Terms & Continue",
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
