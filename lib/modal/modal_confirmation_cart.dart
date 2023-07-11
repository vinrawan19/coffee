import 'package:coffee_shop/controller/order/order_cubit.dart';
import 'package:coffee_shop/modal/modal_add_to_cart.dart';
import 'package:coffee_shop/page/order_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void modalConfirmationCart(context, blocCtx, {bool? isCloseButton}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    builder: (context) => BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        double totalPrice = 0;
        for (var e in (state as OrderLoaded).products) {
          totalPrice += e.product.price;
        }
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Your Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: ListView.builder(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color:
                                              Colors.grey.withOpacity(0.5)))),
                              child: ListTile(
                                dense: true,
                                visualDensity: VisualDensity.compact,
                                onTap: () => addToCartModal(
                                  context,
                                  data: state.products[index].product,
                                  blocCtx: blocCtx,
                                  initConf: state.products[index].config,
                                  index: index,
                                ),
                                leading: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12)),
                                      child: Image.asset(
                                        state.products[index].product.asset,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                title: Text(
                                  state.products[index].product.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  state.products[index].product.price
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: TextButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red)),
                                    onPressed: () {
                                      context
                                          .read<OrderCubit>()
                                          .removeOrder(index);
                                      if (state.products.isEmpty &&
                                          isCloseButton == true) {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        // ignore: prefer_is_empty
                                      } else if (state.products.length < 1) {
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text(
                                      "Remove",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.075,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            Text(
                              "${state.products.length} Items",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Rp. ${totalPrice.toString().replaceAll(".0", "")}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue)),
                          onPressed: () {
                            if (isCloseButton == true) {
                              Navigator.pop(context);
                            } else {
                              state.products.isNotEmpty
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OrderConfirmationPage()))
                                  : Navigator.pop(context);
                            }
                          },
                          child: Text(
                            isCloseButton == true ? "Close" : "Checkout",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
