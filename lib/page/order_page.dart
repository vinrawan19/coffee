import 'package:coffee_shop/controller/order/order_cubit.dart';
import 'package:coffee_shop/modal/modal_add_to_cart.dart';
import 'package:coffee_shop/modal/modal_confirmation_cart.dart';
import 'package:coffee_shop/model/product_model.dart';
import 'package:coffee_shop/page/order_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List filter = ["All", "Coffee", "Tea", "Chocolate"];
  String selectedFilter = "All";
  List<ProductModel> dummyData = [
    ProductModel(
        id: 1,
        name: "Americano",
        type: "Coffee",
        price: 20000,
        details: "Consist of espresso and water",
        asset: "assets/dummy/americano.png",
        productCustomization: ['size', 'temperature', 'coffee']),
    ProductModel(
        id: 2,
        name: "Caffe Latte",
        type: "Coffee",
        price: 22000,
        details: "Consist of espresso and milk",
        asset: "assets/dummy/caffe-latte.png",
        productCustomization: [
          'size',
          'temperature',
          'milk',
          'sugar',
          'coffee',
        ]),
    ProductModel(
        id: 3,
        name: "Matcha Latte",
        type: "Matcha",
        price: 25000,
        details: "Consist of matcha and water",
        productCustomization: ['size', 'temperature']),
    ProductModel(
        id: 4,
        name: "Green Tea",
        type: "Tea",
        price: 25000,
        details: "Consist of matcha and water",
        productCustomization: ['size', 'temperature']),
    ProductModel(
        id: 5,
        name: "Hot Chocolate",
        type: "Chocolate",
        price: 25000,
        details: "Consist of chocolate and water",
        productCustomization: ['size']),
  ];
  List<ProductModel> filterTemp = [];
  List<ProductModel> data = [];

  @override
  void initState() {
    super.initState();
    data = dummyData
        .where((e) => e.type == selectedFilter || selectedFilter == 'All')
        .toList();
    filterTemp = data;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(243, 242, 248, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Browse",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Container(
                  width: mediaQuery.width * 0.4,
                  color: Colors.white,
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      isDense: true,
                      hint: const Text("Senayan City"),
                      itemHeight: mediaQuery.height * 0.075,
                      value: 1,
                      items: const [
                        DropdownMenuItem(
                          value: 0,
                          child: Text("Central Park Mall"),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Senayan City"),
                        )
                      ],
                      onChanged: (v) {},
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Container(
                padding: const EdgeInsets.all(2),
                height: mediaQuery.height * 0.05,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Color.fromRGBO(228, 227, 232, 1),
                ),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    isDense: true,
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search_sharp),
                    suffixIcon: Icon(Icons.mic),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  onChanged: (v) {
                    if (v != "") {
                      setState(() {
                        data = data
                            .where((e) =>
                                e.name.toLowerCase().contains(v.toLowerCase()))
                            .toList();
                      });
                    } else {
                      setState(() {
                        data = filterTemp;
                      });
                    }
                  },
                ),
              ),
            ),
            filterChip(),
            BlocBuilder<OrderCubit, OrderState>(builder: (ctx, state) {
              double totalPrice = 0;
              for (var e in (state as OrderLoaded).products) {
                totalPrice += e.product.price;
              }
              return Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: GridView.builder(
                          itemCount: data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisExtent: 225),
                          itemBuilder: (context, index) =>
                              orderCard(data: data[index], blocContext: ctx),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.08,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: GestureDetector(
                            onTap: () => modalConfirmationCart(context, ctx),
                            child: Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                        "${(state).products.length} Items"),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Rp. ${totalPrice.toString().replaceAll(".0", "")}",
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Icon(
                                          Icons.shopping_bag_rounded,
                                          color: Colors.blue,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget filterChip() {
    return StatefulBuilder(builder: (context, refresh) {
      return Row(
        children: filter
            .map<Widget>((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      refresh(() => selectedFilter = e);
                      setState(() {
                        data = dummyData
                            .where((e) =>
                                e.type == selectedFilter ||
                                selectedFilter == 'All')
                            .toList();
                      });
                    },
                    child: Chip(
                      side: selectedFilter == e
                          ? const BorderSide(color: Colors.blue)
                          : BorderSide.none,
                      label: Text(e),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ))
            .toList(),
      );
    });
  }

  Widget orderCard(
      {required ProductModel data, required BuildContext blocContext}) {
    String price = data.price.toString();
    var priceSubstring = price.replaceAll(".0", "");
    return SizedBox(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(data.asset, fit: BoxFit.fitWidth),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp. $priceSubstring",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  style: const ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            side: BorderSide(color: Colors.blue)),
                      )),
                  onPressed: () =>
                      addToCartModal(context, data: data, blocCtx: blocContext),
                  child: const Text("Add"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
