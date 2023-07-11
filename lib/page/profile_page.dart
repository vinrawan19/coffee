import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: mediaQuery.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaQuery.height * 0.245,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 25,
                    backgroundColor: Colors.grey[400],
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  const Text("Grace Davis",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
                  const Chip(
                    elevation: 6,
                    backgroundColor: Colors.white,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    ),
                    label: Text("Gold"),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 4.0),
              child: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: mediaQuery.height * 0.22,
                child: Card(
                  margin: const EdgeInsets.all(0),
                  shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: const [
                      ListTile(
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.person),
                        title: Text("Personal Details"),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      ListTile(
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.edit),
                        title: Text("Edit Account"),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      ListTile(
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.history_rounded),
                        title: Text("Transaction History"),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      ListTile(
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.discount_rounded),
                        title: Text("Promo & Rewards"),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 4.0),
              child: Text(
                "Finances",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: mediaQuery.height * 0.055,
                child: Card(
                  margin: const EdgeInsets.all(0),
                  shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: const [
                      ListTile(
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.credit_card_rounded),
                        title: Text("Debit / Credit"),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 4.0),
              child: Text(
                "Services",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 4.0),
              child: SizedBox(
                height: mediaQuery.height * 0.115,
                child: Card(
                  margin: const EdgeInsets.all(0),
                  shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: const [
                      ListTile(
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.card_membership_rounded),
                        title: Text("Membership"),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      ListTile(
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.headset_mic_rounded),
                        title: Text("Customer Service"),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                width: mediaQuery.width,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {},
                    child: const Text(
                      "Log Out",
                      style: TextStyle(color: Colors.red),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
