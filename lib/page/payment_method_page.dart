import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_rounded)),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Payment Method",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "E-WALLET",
              style: TextStyle(color: Colors.grey),
            ),
            Card(
              child: SizedBox(
                height: mediaQuery.height * 0.275,
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(305, 226, 220, 220)))),
                  child: ListView(
                    children: [
                      paymentCardTile("OVO"),
                      paymentCardTile("Gopay"),
                      paymentCardTile("Gopaylater"),
                      paymentCardTile("Dana"),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              "VIRTUAL ACCOUNT",
              style: TextStyle(color: Colors.grey),
            ),
            Card(
              child: SizedBox(
                height: mediaQuery.height * 0.275,
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(305, 226, 220, 220)))),
                  child: ListView(
                    children: [
                      paymentCardTile("BCA"),
                      paymentCardTile("Mandiri"),
                      paymentCardTile("BNI"),
                      paymentCardTile("CIMB"),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              "CARD",
              style: TextStyle(color: Colors.grey),
            ),
            Card(
              child: SizedBox(
                height: mediaQuery.height * 0.215,
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(305, 226, 220, 220)))),
                  child: ListView(
                    children: [
                      paymentCardTile("BCA"),
                      paymentCardTile("Mandiri"),
                      paymentCardTile("BNI"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget paymentCardTile(title) {
    return ListTile(
      onTap: () => Navigator.pop(context),
      contentPadding: const EdgeInsets.all(5.6),
      shape: const Border(
          bottom: BorderSide(color: Color.fromARGB(305, 224, 220, 220))),
      visualDensity: VisualDensity.compact,
      dense: true,
      leading: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
    );
  }
}
