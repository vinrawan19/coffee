import 'package:coffee_shop/page/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.45,
                child: LottieBuilder.asset('assets/lottie/signup-lottie.json')),
            Row(
              children: const [
                Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.225,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Card(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "+62",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            prefixStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            hintText: "     Phone Number"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyHomePage(),
                              )),
                          child: const Text("Send OTP")),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        text: "Already have an account?",
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    )),
                              text: " Sign in",
                              style: const TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "---------------------   Or sign in with   ----------------------",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cardOtherSignIn("assets/login/google-icon.png"),
                  cardOtherSignIn("assets/login/facebook-icon.png"),
                  cardOtherSignIn("assets/login/apple-icon.png"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardOtherSignIn(asset) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 70,
        child: Card(
          child: Image.asset(
            asset,
            fit: BoxFit.none,
          ),
        ),
      ),
    ));
  }
}
