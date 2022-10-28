import 'package:aman_project/widgets/navBar.dart';

import '../data/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class wish_list extends StatefulWidget {
  wish_list({Key? key}) : super(key: key);

  @override
  State<wish_list> createState() => _wish_listState();
}

class _wish_listState extends State<wish_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 210),
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/images/wishlist.png", width: 200),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Your WishList is Empty!',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Esplore more and shortlist some items',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    child: Text('Start SHOPPING'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 205, 153, 51),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => navBar(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
