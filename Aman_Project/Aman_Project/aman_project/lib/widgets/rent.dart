import 'package:flutter/material.dart';
import './rent_Type.dart';

class Rents extends StatelessWidget {
  const Rents({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 231, 231),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon(Icons.menu, color: Colors.white, size: 50.0),
                  // Image.asset(
                  //   "assets/images/dont-touch.png",
                  //   width: 50.0,
                  // )
                ],
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text(
                  "Rents options",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 500,
                child: Center(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 41, 38, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          // minimumSize: const Size(120, 50),
                          // maximumSize: const Size(200, 100),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RentType(rentID: 2),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Card(
                            color: Color.fromARGB(255, 41, 38, 38),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/dont-touch.png",
                                        width: 64.0),
                                    SizedBox(height: 10.0),
                                    Text("Didn't Pay",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        )),
                                    SizedBox(height: 5.0),
                                    Text("2 Items",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 41, 38, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RentType(rentID: 1),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Card(
                            color: Color.fromARGB(255, 41, 38, 38),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/paid.png",
                                        width: 64.0),
                                    SizedBox(height: 10.0),
                                    Text("Paid",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        )),
                                    SizedBox(height: 5.0),
                                    Text("20 Items",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 41, 38, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RentType(rentID: 4),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Card(
                            color: Color.fromARGB(255, 41, 38, 38),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/dead 2.png",
                                        width: 64.0),
                                    SizedBox(height: 10.0),
                                    Text("Contract Old",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        )),
                                    SizedBox(height: 5.0),
                                    Text("15 Items",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 41, 38, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RentType(rentID: 3),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Card(
                            color: Color.fromARGB(255, 41, 38, 38),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/calendar.png",
                                        width: 64.0),
                                    SizedBox(height: 10.0),
                                    Text("New Contract",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        )),
                                    SizedBox(height: 5.0),
                                    Text("7 Items",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
