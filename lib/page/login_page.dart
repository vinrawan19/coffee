import 'package:coffee_shop/main.dart';
import 'package:coffee_shop/page/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Hello Again!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                Text(
                  "Welcome back you've",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "been missed",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "Username",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          prefixStyle: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          hintText: "     Required"),
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          hintText: "      Required"),
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
                          child: const Text("Sign In")),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        text: "Not registered yet?",
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignupPage(),
                                    )),
                              text: " Create an account",
                              style: const TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "---------------------   Or sign in with   ----------------------",
                style: TextStyle(color: Colors.grey),
              ),
            ],
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
    );
  }

  Widget cardOtherSignIn(asset) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
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
