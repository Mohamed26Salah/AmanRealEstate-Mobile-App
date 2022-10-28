import 'package:aman_project/widget_tree.dart';
import '/widgets/edit_profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../widgets/search.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart';
import 'rent.dart';

class navBar extends StatelessWidget {
  const navBar({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // initialRoute: 'mainPage',
      // routes: {
      //   'mainPage': (context) => const Search(),
      //   'profile': (context) => const EditProfile(),

      // } ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    Search(),
    Rents(),
    EditProfile(),
    WidgetTree(),
  ];

  int index = 0;

  List<Property> properties = getPropertyList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: index,
      //   onTap: (i) => setState((() => index = i)),
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person) , label: 'Profile'),
      //   ],
      // ),

      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: GNav(
            onTabChange: (i) {
              setState(() {
                index = i;
              });
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
            ],
          ),
        ),
      ),
    );
  }
}