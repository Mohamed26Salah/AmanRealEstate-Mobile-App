import 'package:flutter/material.dart';

class RentsPage extends StatelessWidget {
  const RentsPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const NavBarGR(),
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const [
              Card(
                child: Icon(
                  Icons.star,
                  size: 50,
                  color: Colors.yellow,
                ),
              ),
              Card(
                child: Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Card(
                child: Icon(
                  Icons.thumb_up,
                  size: 50,
                  color: Colors.green,
                ),
              ),
              Card(
                child: Icon(
                  Icons.send,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
      // GridView.builder(
      //     physics: const ScrollPhysics(),
      //     shrinkWrap: true,
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       crossAxisSpacing: 8,
      //       mainAxisSpacing: 10,
      //     ),
      //     itemCount: 4,
      //     itemBuilder: (_, index) {
      //       return const Card(
      //         child: Icon(
      //           Icons.star,
      //           size: 50,
      //           color: Colors.yellow,
      //         ),
      //       );
      //     }),
      // body: GridView.count(
      //   mainAxisSpacing: 10,
      //   crossAxisSpacing: 10,
      //   crossAxisCount: 4,
      //   children: const [
      //     Card(
      //       child: Icon(
      //         Icons.star,
      //         size: 50,
      //         color: Colors.yellow,
      //       ),
      //     ),
      //     Card(
      //       child: Icon(
      //         Icons.favorite,
      //         size: 50,
      //         color: Colors.red,
      //       ),
      //     ),
      //     Card(
      //       child: Icon(
      //         Icons.thumb_up,
      //         size: 50,
      //         color: Colors.green,
      //       ),
      //     ),
      //     Card(
      //       child: Icon(
      //         Icons.send,
      //         size: 50,
      //         color: Colors.blue,
      //       ),
      //     ),
      //   ],
      // ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: ListView(
      //       children: [
      //         Card(
      //           elevation: 5,
      //           margin: const EdgeInsets.symmetric(
      //             vertical: 8,
      //             horizontal: 5,
      //           ),
      //           child: ListTile(
      //             onTap: () {
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(
      //               //     builder: (context) => RentType(rentID: 2),
      //               //   ),
      //               // );

      //               Navigator.of(context)
      //                   .pushNamed('/rents', arguments: {'rentID': 2});
      //               // context.push('/Rents/RentType/${2}');
      //             },
      //             leading: CircleAvatar(
      //               backgroundColor: Colors.black,
      //               radius: 30,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(6),
      //                 child: Image.asset("assets/images/dont-touch.png"),
      //               ),
      //             ),
      //             title: Text(
      //               "Didn't Pay",
      //               style: Theme.of(context).textTheme.headline6,
      //             ),
      //             subtitle: const Text(
      //               "2 Items",
      //             ),
      //           ),
      //         ),
      //         Card(
      //           elevation: 5,
      //           margin: const EdgeInsets.symmetric(
      //             vertical: 8,
      //             horizontal: 5,
      //           ),
      //           child: ListTile(
      //             onTap: () {
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(
      //               //     builder: (context) => RentType(rentID: 1),
      //               //   ),
      //               // );
      //               Navigator.of(context)
      //                   .pushNamed('/rents', arguments: {'rentID': 1});
      //               // context.push('/Rents/RentType/${1}');
      //             },
      //             leading: CircleAvatar(
      //               backgroundColor: Colors.black,
      //               radius: 30,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(6),
      //                 child: Image.asset("assets/images/paid.png"),
      //               ),
      //             ),
      //             title: Text(
      //               "Paid",
      //               style: Theme.of(context).textTheme.headline6,
      //             ),
      //             subtitle: const Text(
      //               "20 Items",
      //             ),
      //           ),
      //         ),
      //         Card(
      //           elevation: 5,
      //           margin: const EdgeInsets.symmetric(
      //             vertical: 8,
      //             horizontal: 5,
      //           ),
      //           child: ListTile(
      //             onTap: () {
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(
      //               //     builder: (context) => RentType(rentID: 4),
      //               //   ),
      //               // );
      //               // GoRouter.of(context).push('/RentType/${4}');
      //               Navigator.of(context)
      //                   .pushNamed('/rents', arguments: {'rentID': 4});
      //               // context.push('/Rents/RentType/${4}');
      //             },
      //             leading: CircleAvatar(
      //               backgroundColor: Colors.black,
      //               radius: 30,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(6),
      //                 child: Image.asset("assets/images/dead 2.png"),
      //               ),
      //             ),
      //             title: Text(
      //               "Contract Old",
      //               style: Theme.of(context).textTheme.headline6,
      //             ),
      //             subtitle: const Text(
      //               "15 Items",
      //             ),
      //           ),
      //         ),
      //         Card(
      //           elevation: 5,
      //           margin: const EdgeInsets.symmetric(
      //             vertical: 8,
      //             horizontal: 5,
      //           ),
      //           child: ListTile(
      //             onTap: () {
      //               // Navigator.push(
      //               //   context,
      //               //   MaterialPageRoute(
      //               //     builder: (context) => RentType(rentID: 3),
      //               //   ),
      //               // );
      //               // context.push('/Rents/RentType/${3}');
      //               Navigator.of(context)
      //                   .pushNamed('/rents', arguments: {'rentID': 3});
      //             },
      //             leading: CircleAvatar(
      //               backgroundColor: Colors.black,
      //               radius: 30,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(6),
      //                 child: Image.asset("assets/images/calendar.png"),
      //               ),
      //             ),
      //             title: Text(
      //               "New Contract",
      //               style: Theme.of(context).textTheme.headline6,
      //             ),
      //             subtitle: const Text(
      //               "7 Items",
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
