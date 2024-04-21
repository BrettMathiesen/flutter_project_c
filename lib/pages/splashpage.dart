import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Mental Check',
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 145, 245, 247))),
      ),
      backgroundColor: Color.fromARGB(255, 220, 246, 250),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Text('Welcome',
                style: TextStyle(
                    fontSize: 64,
                    color: Colors.deepPurpleAccent,
                    fontFamily: 'Lobster')),
            const SizedBox(
              width: 50,
              height: 50,
            ),
            const SizedBox(
              width: 185,
              height: 185,
              child: Image(image: AssetImage("assets/Flower.png")),
            ),
            const SizedBox(
              width: 10,
              height: 10,
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
                  Navigator.pushNamed(context, "/disclaimer");
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
