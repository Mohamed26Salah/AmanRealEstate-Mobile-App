import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: GNav(
          tabBorderRadius: 100,
          iconSize: 20,
          padding: EdgeInsets.all(15),
          backgroundColor: (Colors.grey[300])!,
          color: Colors.black,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.orange,
          gap: 8,
          tabs: [
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
            
            
          ],
        ),
      ),
    );
  }
}
