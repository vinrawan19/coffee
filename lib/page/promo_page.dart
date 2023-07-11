import 'package:coffee_shop/model/promo_model.dart';
import 'package:flutter/material.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  List<PromoModel> promos = [
    PromoModel(
      id: 1,
      label: "Free Drinks",
      subtitle: "Ayo segera dapatkan minuman gratis untuk pengguna baru",
      formula: '*0',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                      "Promo & Rewards",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Got a promo code? Enter here",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    suffixIcon: Icon(Icons.keyboard_arrow_right_rounded)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: promos.length,
                    itemBuilder: (context, index) {
                      var indexData = promos[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              ListTile(
                                dense: true,
                                visualDensity: VisualDensity.compact,
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                                title: Text(indexData.label),
                                subtitle: Text(indexData.subtitle),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color:
                                                Colors.grey.withOpacity(0.5)))),
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text('Use Promo')),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
