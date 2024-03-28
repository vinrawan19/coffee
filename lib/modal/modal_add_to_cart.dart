import 'package:coffee_shop/controller/order/order_cubit.dart';
import 'package:coffee_shop/model/beverage_config_model.dart';
import 'package:coffee_shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

List<BeverageConfigModel> dummyBeverageConfig = [
  BeverageConfigModel(
    type: 'size',
    label: 'Cup Size',
    configs: [
      Config(
          asset: 'assets/drinks/small-size.png',
          label: 'Regular',
          subLabel: '20 Oz',
          value: 'regular'),
      Config(
          asset: 'assets/drinks/large-size.png',
          label: 'Large',
          subLabel: '40 Oz',
          value: 'large'),
    ],
  ),
  BeverageConfigModel(
    type: 'temperature',
    label: "Temperature",
    configs: [
      Config(
          asset: 'assets/drinks/cold.png',
          label: 'Cold',
          subLabel: '',
          value: 'cold'),
      Config(
          asset: 'assets/drinks/hot.png',
          label: 'Hot',
          subLabel: '',
          value: 'hot'),
    ],
  ),
  BeverageConfigModel(
    type: 'sugar',
    label: "Sweetness",
    configs: [
      Config(
          asset: 'assets/drinks/normal-sugar.png',
          label: 'Normal Sugar',
          subLabel: '',
          value: 'normal'),
      Config(
          asset: 'assets/drinks/less-sugar.png',
          label: 'Less Sugar',
          subLabel: '',
          value: 'less'),
    ],
  ),
  BeverageConfigModel(
    type: 'milk',
    label: 'Milk',
    configs: [
      Config(
          asset: 'assets/drinks/small-size.png',
          label: 'Whole Milk',
          subLabel: '',
          value: 'normal'),
      Config(
          asset: 'assets/drinks/small-size.png',
          label: 'Oat Milk',
          subLabel: '',
          value: 'oat'),
    ],
  ),
  BeverageConfigModel(
    type: 'coffee',
    label: 'Add on',
    configs: [
      Config(
          asset: 'assets/drinks/additional-shot.png',
          label: 'Additional Espresso Shot',
          subLabel: '',
          value: 'espresso'),
    ],
  ),
];

List<Widget> renderWidget = [];
List<Map<String, String>> selectedConfig = [];

void configCard(data, {List<Map<String, String>>? initConfig}) {
  renderWidget = [];
  selectedConfig = initConfig ?? [];
  String bindEspresso =
      initConfig?.firstWhereOrNull((e) => e['type'] == 'coffee')?['value'] ??
          '0';
  var additionalEspresso = int.parse(bindEspresso);
  for (var e in dummyBeverageConfig) {
    renderWidget.add(StatefulBuilder(builder: (context, refresh) {
      return Visibility(
        visible: data.productCustomization.contains(e.type),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              e.label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              children: e.configs
                  .map<Widget>((a) => Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: selectedConfig
                                      .where((x) =>
                                          x['value'] == a.value &&
                                          x['type'] == e.type)
                                      .toList()
                                      .isNotEmpty
                                  ? const BorderSide()
                                  : BorderSide.none,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            onTap: () =>
                                refresh(() => onTappedCard(e.type, a.value)),
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: Image.asset(a.asset),
                            ),
                            title: Text(a.label),
                            subtitle:
                                a.subLabel != "" ? Text(a.subLabel) : null,
                            trailing: e.type == 'coffee'
                                ? SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            splashRadius: 10,
                                            onPressed: () {
                                              additionalEspresso > 0
                                                  ? refresh(() {
                                                      additionalEspresso--;
                                                      onTappedCard(
                                                          e.type,
                                                          additionalEspresso
                                                              .toString());
                                                    })
                                                  : null;
                                            },
                                            icon: const Icon(
                                                Icons.remove_circle)),
                                        Text(additionalEspresso.toString()),
                                        IconButton(
                                            splashRadius: 10,
                                            padding: const EdgeInsets.all(2),
                                            onPressed: () {
                                              refresh(
                                                  () => additionalEspresso++);
                                              onTappedCard(
                                                  e.type,
                                                  additionalEspresso
                                                      .toString());
                                            },
                                            icon: const Icon(Icons.add_circle))
                                      ],
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      );
    }));
  }
}

void onTappedCard(type, value) {
  selectedConfig.removeWhere((e) => e['type'] == type);
  selectedConfig.add({'type': type, 'value': value});
}

void addToCartModal(context,
    {required ProductModel data,
    required BuildContext blocCtx,
    List<Map<String, String>>? initConf,
    int? index}) {
  configCard(data, initConfig: initConf);
  showModalBottomSheet(
    context: blocCtx,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    builder: (context) {
      return SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                data.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...renderWidget
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.075,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocConsumer<OrderCubit, OrderState>(
                    listener: (context, state) {
                      if (state is OrderCustomizationValidation) {
                        showDialog(
                            context: context,
                            builder: (context) => ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: AlertDialog(
                                    actionsPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 8),
                                    title: const Text("Alert"),
                                    content: const Text(
                                        "Mohon untuk memilih seluruh konfigurasi minuman!"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Okay"))
                                    ],
                                  ),
                                ));
                      }
                    },
                    builder: (context, state) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                if (initConf != null) {
                                  blocCtx
                                      .read<OrderCubit>()
                                      .updateOrder(index, selectedConfig);
                                } else {
                                  blocCtx
                                      .read<OrderCubit>()
                                      .addOrder(data, selectedConfig);
                                }
                                Navigator.pop(context);
                              },
                              child: const Text("Add")),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ));
    },
  );
}
