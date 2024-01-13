import 'dart:async';

import 'package:coffee_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void didChangeDependencies() {
    autoNavigate();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset('assets/lottie/lottie-ok.json'),
            const Text(
              "Payment Successful",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            )
          ],
        )),
      ),
    );
  }

  void autoNavigate() async {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }
}
