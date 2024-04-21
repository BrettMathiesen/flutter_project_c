import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

// UserName: brett
// Email: brett@email.com
// Password: 1#Firebase

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginPage = true;

  final _formkey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  authenticate(context) {
    final validity = _formkey.currentState!.validate();

    if (validity) {
      _formkey.currentState!.save();

      submitForm(emailController.text, passwordController.text,
          userNameController.text, context);
    }
  }

  Future submitForm(
      String email, String password, String username, context) async {
    final auth = FirebaseAuth.instance;

    UserCredential authResult;

    try {
      if (isLoginPage) {
        //login
        authResult = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.pushNamed(context, '/splash');
      } else {
        //signup
        authResult = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String uid = authResult.user!.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .set({username: username, email: email});
        // print('signed-up');
        // Navigator.pushNamed(context, '/splash');
      }
    } catch (error) {
      print('error');
    }
  }

  //
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: isLoginPage
            ? const Text("Login",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 145, 245, 247)))
            : const Text("Signup",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 145, 245, 247))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 120.0, left: 25.0, right: 25.0, bottom: 10),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (!emailValid) {
                        return "Enter valid email address";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(255, 194, 232, 249),
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: "Enter Email",
                    ),
                  ),
                ),
                if (!isLoginPage)
                  Container(
                    margin: const EdgeInsets.only(
                        top: 0.0, left: 25.0, right: 25.0, bottom: 10),
                    child: TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "UserName is required!";
                        }
                      },
                      decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 194, 232, 249),
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: "Enter UserName"),
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 0.0, left: 25.0, right: 25.0, bottom: 10),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) {
                      final bool validPass = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value!);
                      if (!validPass) {
                        return "Enter valid Password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(255, 194, 232, 249),
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: "Enter Password",
                    ),
                  ),
                ),
                if (!isLoginPage)
                  const SizedBox(
                    height: 130,
                  ),
                if (isLoginPage)
                  const SizedBox(
                    height: 205,
                  ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLoginPage = !isLoginPage;
                    });
                  },
                  child: isLoginPage
                      ? const Text('Not a Member?')
                      : const Text('Already a Member?'),
                )
              ],
            ),
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
                  authenticate(context);
                },
                child: isLoginPage
                    ? const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 231, 246, 243)),
                      )
                    : const Text(
                        'Signup',
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
