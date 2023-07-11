import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  Function navigateToOrderPage;
  HomePage({super.key, required this.navigateToOrderPage});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Portal to endless possibilities',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    fontFamily: 'Recoleta',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Image.asset('assets/dashboard/peoples.png'),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(243, 242, 248, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )),
                  width: mediaQuery.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Your Favorites",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  ListTile(
                                    shape: const Border(
                                        bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 240, 237, 237))),
                                    dense: true,
                                    visualDensity: VisualDensity.compact,
                                    leading: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          "assets/dummy/americano.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    title: const Text("Americano"),
                                    subtitle:
                                        const Text("Hot, No sugar, Medium"),
                                    trailing: TextButton(
                                        onPressed: () =>
                                            widget.navigateToOrderPage(),
                                        child: const Text("Order  >")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                width: mediaQuery.width,
                height: mediaQuery.height * 0.09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ongoing order",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        const Text(
                          "The magic awaits...",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Order now!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 15,
                              width: 15,
                              child: Image.asset(
                                'assets/dashboard/coffee.png',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => widget.navigateToOrderPage(),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.black,
                        ),
                        child: const Center(
                            child: Text(
                          "Order",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
