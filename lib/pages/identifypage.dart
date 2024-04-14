import 'package:flutter/material.dart';

class IdentifyPage extends StatefulWidget {
  final String? situation;
  const IdentifyPage({super.key, required this.situation});

  @override
  State<IdentifyPage> createState() => _IdentifyPageState();
}

class _IdentifyPageState extends State<IdentifyPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController situationController = TextEditingController();

  String validateText = "";
  String reassureText = "";
  String actionText = "";

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
          children: [
            Flexible(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(' Situation:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.deepPurpleAccent, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Text("${widget.situation}"))
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(' Identify:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
                    decoration: BoxDecoration(
                        //color: Colors.white,
                        border: Border.all(
                            color: Colors.deepPurpleAccent, width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Identify the strongest emotion you are feeling in your body at this time.  Press the button below:',
                                style: TextStyle(backgroundColor: Colors.white

                                    /* color: Colors.black,
                                              background: Paint()
                                                ..strokeWidth = 20
                                                ..color = Colors.white
                                                ..style = PaintingStyle.stroke
                                                ..strokeJoin = StrokeJoin.round
                                                ..strokeCap = StrokeCap.round */

                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.deepPurpleAccent,
                                      width: 2)),
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: () {
                                  setState(() {
                                    validateText =
                                        'I understand why you would feel scared.';
                                    reassureText =
                                        'You can get past this one step at a time.';
                                    actionText =
                                        'Being brave is moving forward even when scared.';
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Ink.image(
                                      image:
                                          const AssetImage('assets/Fear.png'),
                                      height: 35,
                                      width: 35,
                                    ),
                                    const Text(
                                      'Afraid',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.deepPurpleAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.deepPurpleAccent,
                                      width: 2)),
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: () {
                                  setState(() {
                                    validateText = 'Your anger makes sense.';
                                    reassureText =
                                        'I know this is challenging.';
                                    actionText =
                                        'Go be alone.  Find a pillow, and scream into it.';
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Ink.image(
                                      image:
                                          const AssetImage('assets/Angry.png'),
                                      height: 35,
                                      width: 35,
                                    ),
                                    const Text(
                                      'Angry',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.deepPurpleAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.deepPurpleAccent,
                                      width: 2)),
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: () {
                                  setState(() {
                                    validateText =
                                        'Of course you would feel sad.';
                                    reassureText =
                                        'Remember this situation will pass.';
                                    actionText =
                                        'Go be alone.  Allow the tears to come.';
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Ink.image(
                                      image: const AssetImage('assets/Sad.png'),
                                      height: 35,
                                      width: 35,
                                    ),
                                    const Text(
                                      'Sad',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.deepPurpleAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.deepPurpleAccent,
                                      width: 2)),
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: () {
                                  setState(() {
                                    validateText =
                                        'You deserve this moment of happiness.';
                                    reassureText =
                                        'It is wonderful you feel joy.';
                                    actionText =
                                        'Enjoy this feeling while you have it.';
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Ink.image(
                                      image:
                                          const AssetImage('assets/Smile.png'),
                                      height: 35,
                                      width: 35,
                                    ),
                                    const Text(
                                      'Happy',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.deepPurpleAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(' Validate:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.deepPurpleAccent, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(validateText)],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(' Reassurance:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.deepPurpleAccent, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(reassureText)],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(' Suggestions:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.deepPurpleAccent, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(actionText)],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.deepPurpleAccent),
                onPressed: () {
                  Navigator.pushNamed(context, "/emotions");
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 231, 246, 243)),
                ),
              ),
            )
          ],
        ),
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
