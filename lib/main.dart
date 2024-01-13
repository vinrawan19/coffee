import 'package:coffee_shop/controller/order/order_cubit.dart';
import 'package:coffee_shop/page/history_page.dart';
import 'package:coffee_shop/page/home_page.dart';
import 'package:coffee_shop/page/login_page.dart';
import 'package:coffee_shop/page/order_page.dart';
import 'package:coffee_shop/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderCubit>(
            create: (context) => OrderCubit()..initOrder()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SafeArea(child: LoginPage()),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomNavIndex = 0;

  late final List _buildBody = [
    HomePage(navigateToOrderPage: () => navigateToOrderPage()),
    const OrderPage(),
    const HistoryPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 247, 174, 1),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: bottomNavIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.coffee,
            ),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (i) => setState(() => bottomNavIndex = i),
      ),
      body: _buildBody[bottomNavIndex],
    );
  }

  void navigateToOrderPage() {
    setState(() {
      bottomNavIndex = 1;
    });
  }
}
