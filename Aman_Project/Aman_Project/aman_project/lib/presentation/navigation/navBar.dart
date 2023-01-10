import 'package:aman_project/location/location_screen.dart';
import 'package:aman_project/presentation/properties/wish_list.dart';
import '../../data/repositories/user_providers.dart';
import '../../theme/theme_manager.dart';
import '../profile/edit_profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../properties/main_page.dart';
import 'package:flutter/material.dart';
import '../dashboard/panel_left/panel_left_page.dart';
import '../rents/rents_page.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// class navBar extends StatelessWidget {
//   const navBar({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const NavBar(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class NavBar extends ConsumerStatefulWidget {
  final ThemeManager? themeManager;
  const NavBar({super.key, required this.themeManager});

  @override
  ConsumerState<NavBar> createState() => _NavBarState();
}

class _NavBarState extends ConsumerState<NavBar> {
  int index = 0;

  // List<Property> properties = getPropertyList();
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(newUserDataProivder);

    List<Widget> pages = [
      const Search(),
      wish_list(),
      EditProfile(themeManager: widget.themeManager),
      // const Location(),
    ];

    if (userData?.role == 'admin') {
      pages.add(const RentsPage());
      pages.add(PanelLeftPage());
    }
    if (userData?.role == 'moderator') {
      pages.add(const RentsPage());
    }
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: GNav(
            
            onTabChange: (i) {
              setState(() {
                index = i;
              });
            },
          
            selectedIndex: index,
            tabBorderRadius: 100,
            iconSize: 25,
            padding: const EdgeInsets.all(15),
            backgroundColor: (Colors.grey[300])!,
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Theme.of(context).primaryColor,
            gap: 8,
            // onTabChange: (value) => print,
            tabs: [
              const GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              const GButton(
                icon: Icons.favorite,
                text: 'Likes',
              ),
              const GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
              // const GButton(
              //   icon: Icons.location_pin,
              //   text: 'Location',
              // ),
              if (userData?.role == 'admin')
                const GButton(
                  icon: Icons.apartment,
                  text: 'Rents',
                ),
              if (userData?.role == 'admin')
                const GButton(
                  icon: Icons.dashboard,
                  text: 'Dashboard',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
