import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarGR extends StatefulWidget {
  const NavBarGR({super.key});

  @override
  State<NavBarGR> createState() => _NavBarGRState();
}

class _NavBarGRState extends State<NavBarGR> {
  List<String> pages = ['/', '/Rents', '/WishList', '/profile', '/Dashboard'];

  static int index = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: GNav(
          onTabChange: (i) {
            setState(() {
              index = i;
            });
            context.go(pages[i]);
          },

          selectedIndex: index,
          tabBorderRadius: 100,
          iconSize: 20,
          padding: const EdgeInsets.all(15),
          backgroundColor: (Colors.grey[300])!,
          color: Colors.black,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.orange,
          gap: 8,
          // onTabChange: (value) => print,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.apartment,
              text: 'Rents',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
            GButton(
              icon: Icons.dashboard,
              text: 'Dashboard',
            ),
          ],
        ),
      ),
    );
  }
}
