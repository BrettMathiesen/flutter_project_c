import 'package:flutter/material.dart';
import 'package:project_c/pages/actionpage.dart';

class SoothingPage extends StatefulWidget {
  final String? emotion;
  final String? situation;

  const SoothingPage({super.key, required this.emotion, this.situation});

  @override
  State<SoothingPage> createState() => _SoothingPageState();
}

class _SoothingPageState extends State<SoothingPage> {
  final _formKey = GlobalKey<FormState>();

  String validateText = "";
  String reassureText = "";
  String suggestionText = "";
  String emotionText = "";
  String situationText = "";

  void populateSoothing(value1, value2) {
   
    emotionText = value1;
    print(emotionText);
    print('from soothings page');
    situationText = value2;
    print(situationText);
    print('from soothings page');

    switch (value1) {
      case ("Happy"):
        {
          setState(
            () {
              validateText = 'It is wonderful you feel happiness.';
              reassureText = 'You deserve this moment of joy.';
              suggestionText =
                  'Enjoy this feeling while you have it. Value this ability for enjoyment.  This is great!';
            },
          );
        }
        break;

      case ("Angry"):
        {
          setState(
            () {
              validateText = 'Your anger makes sense.';
              reassureText = 'I know this is challenging.';
              suggestionText =
                  'Go be alone.  Find a pillow, and scream into it.  Also physical exercise can help you decompress, burn off extra tension and reduce stress.';
            },
          ); //statements;
        }
        break;

      case ("Sad"):
        {
          setState(
            () {
              validateText =
                  'Of course you would feel sad in this circumstance.';
              reassureText =
                  'You can get past this one step at a time.  Remember this situation will eventually pass.';
              suggestionText =
                  'Find privacy.  Allow the tears to come.  A 2014 study has shown crying activates the parasympathetic nervous system which allows people to relax. ';
            },
          ); //statements;
        }
        break;

      case ("Guilty"):
        {
          setState(
            () {
              validateText = 'Feeling guilty is completely understandable.';
              reassureText = 'Failure is a part of growth and success.';
              suggestionText =
                  'Sometimes, guilt may indicate the need to apologize for your behavior. If you can not  make amends to someone who has passed away, you can try journaling or writing a letter.';
            },
          ); //statements;
        }
        break;

      case ("Afraid"):
        {
          setState(
            () {
              validateText = 'I understand why you would feel scared.';
              reassureText =
                  'You can get past this one step at a time.  You are safe.';
              suggestionText =
                  'Being brave is moving forward even when frightened.';
            },
          ); //statements;
        }
        break;
      case ("Hurt"):
        {
          setState(
            () {
              validateText = 'Being hurt like this is tough.';
              reassureText = 'That sucks. Sorry you are going through this.';
              suggestionText =
                  'You might take some time to think about why you are feeling the way you are. You could ask yourself why the situation is affecting you so deeply.';
            },
          ); //statements;
        }
        break;

      default:
        {
          setState(
            () {
              validateText = 'Select an emotion button in the previous screen.';
              reassureText =
                  'This will allow some suggestions to sooth yourself.';
              suggestionText =
                  'So unless you make that change this screen will not do anything for you.';
            },
          ); //statements;
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    populateSoothing(widget.emotion, widget.situation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text("Soothing",
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 145, 245, 247)))),
      body: SingleChildScrollView(
        child: Form(
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
                            text: 'Situation > Emotions > ',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                        TextSpan(
                            text: 'Soothing',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurpleAccent)),
                        TextSpan(
                            text: ' > Actions',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 25.0, left: 20.0, right: 8.0, bottom: 0),
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Validate:',
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
                        child:
                            Text((validateText), style: TextStyle(fontSize: 16))),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 8.0, bottom: 0),
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Reassurance:',
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
                        child:
                            Text((reassureText), style: TextStyle(fontSize: 16)))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 8.0, bottom: 0),
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Suggestions:',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5.0, left: 25.0, right: 25.0, bottom: 0),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 194, 232, 249),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text((suggestionText),
                            style: TextStyle(fontSize: 16)))
                  ],
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
                  //    Navigator.pushNamed(context, "/summary");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActionPage(
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
