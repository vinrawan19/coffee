import 'package:coffee_shop/controller/order/order_cubit.dart';
import 'package:coffee_shop/modal/modal_confirmation_cart.dart';
import 'package:coffee_shop/page/payment_method_page.dart';
import 'package:coffee_shop/page/promo_page.dart';
import 'package:coffee_shop/page/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  TextEditingController selectedTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          double totalPrice = 0;
          for (var e in (state as OrderLoaded).products) {
            totalPrice += e.product.price;
          }
          return SafeArea(
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
                                  child:
                                      const Icon(Icons.arrow_back_ios_rounded)),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Your Order",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "PICKUP",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Card(
                          child: ListTile(
                            leading:
                                const CircleAvatar(child: Icon(Icons.alarm)),
                            title: const Text("Pick up time"),
                            subtitle: SizedBox(
                              height: mediaQuery.height * 0.04,
                              child: TextFormField(
                                onTap: () async => await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder: (context, child) => MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: true),
                                    child: child ?? Container(),
                                  ),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() => selectedTime.text =
                                        DateFormat('HH:mm').format(DateTime(1,
                                            1, 1, value.hour, value.minute)));
                                  }
                                }),
                                readOnly: true,
                                controller: selectedTime,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(6),
                                    isDense: true,
                                    hintText: "09:00",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "ORDER ITEMS",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Card(
                          child: SizedBox(
                            height: mediaQuery.height * 0.2,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 226, 220, 220)))),
                                    child: ListView.builder(
                                      itemCount: state.products.length,
                                      itemBuilder: (context, index) {
                                        var indexData = state.products[index];
                                        String configs = "";
                                        for (var e in indexData.config) {
                                          configs += ("${e['value']!}, ");
                                        }
                                        configs = configs.substring(
                                            0, (configs.length - 2));

                                        return ListTile(
                                          visualDensity: VisualDensity.compact,
                                          dense: true,
                                          leading: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              child: Image.asset(
                                                indexData.product.asset,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          title: Text(indexData.product.name),
                                          subtitle: Text(
                                              "Rp. ${indexData.product.price.toString().replaceAll('.0', '')} ($configs)"),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: mediaQuery.width,
                                    height: mediaQuery.height * 0.045,
                                    child: TextButton(
                                        onPressed: () => modalConfirmationCart(
                                            context, context,
                                            isCloseButton: true),
                                        child: const Text("Edit items")))
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          "PAYMENT SUMMARY",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Card(
                          child: SizedBox(
                            height: mediaQuery.height * 0.1,
                            child: ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PromoPage(),
                                  )),
                              leading: const CircleAvatar(
                                child: Icon(Icons.discount_rounded),
                              ),
                              title:
                                  const Text("Apply promos before you order"),
                              subtitle: const Text("4 promos available"),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_sharp,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: SizedBox(
                            height: mediaQuery.height * 0.2,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Price"),
                                        Text(totalPrice
                                            .toString()
                                            .replaceAll('.0', ''))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Service fees"),
                                        Text("2.000")
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Promo"),
                                        Text("0")
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total Payment",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          (totalPrice + 2000)
                                              .toString()
                                              .replaceAll('.0', ''),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: mediaQuery.height * 0.145,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentMethodPage(),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Select payment method",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.credit_card,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SuccessPage(),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Place Order"),
                                Text("You'll earn 50 XP")
                              ],
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
