import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
                            "Americano",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Cup Size",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child:
                                  Image.asset('assets/drinks/small-size.png'),
                            ),
                            title: const Text("Regular"),
                            subtitle: const Text("20 Oz"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child:
                                  Image.asset('assets/drinks/large-size.png'),
                            ),
                            title: const Text("Large"),
                            subtitle: const Text("40 Oz"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Temperature",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: Image.asset('assets/drinks/cold.png'),
                            ),
                            title: const Text("Iced"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: Image.asset('assets/drinks/hot.png'),
                            ),
                            title: const Text("Hot"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Sweetness",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child:
                                  Image.asset('assets/drinks/normal-sugar.png'),
                            ),
                            title: const Text("Normal Sugar"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child:
                                  Image.asset('assets/drinks/less-sugar.png'),
                            ),
                            title: const Text("Less Sugar"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Milk",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child:
                                  Image.asset('assets/drinks/small-size.png'),
                            ),
                            title: const Text("Whole Milk"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child:
                                  Image.asset('assets/drinks/large-size.png'),
                            ),
                            title: const Text("Oat Milk"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Add on",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: Image.asset(
                                  'assets/drinks/additional-shot.png'),
                            ),
                            title: const Text("Additional Espresso Shot"),
                            trailing: SizedBox(
                              width: 75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue, width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30)),
                                    ),
                                    child: const Icon(Icons.remove),
                                  ),
                                  const Text("1"),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue, width: 1),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30)),
                                    ),
                                    child: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Rp 22.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Confirm")),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
