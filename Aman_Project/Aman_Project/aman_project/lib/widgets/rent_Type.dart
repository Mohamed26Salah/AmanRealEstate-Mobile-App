import 'package:flutter/material.dart';
import '/data/rent_data.dart';

class RentType extends StatefulWidget {
  // const RentType({Key? key}) : super(key: key);
  int rentID;
  RentType({super.key, required this.rentID});
  @override
  _RentTypeState createState() => _RentTypeState(this.rentID);
}

class _RentTypeState extends State<RentType> {
  List<Rents> rentsArray = getRentsList();
  Iterable<Rents> rentsArray2 = [];
  List<Rents> rentsArray3 = [];
  int rentID2;
  _RentTypeState(this.rentID2);

  @override
  Widget build(BuildContext context) {
    String image = "";
    if (rentID2 == 2) {
      image = "assets/images/dont-touch.png";
      rentsArray2 = rentsArray.where((e) => e.rentType == 2);
      rentsArray3 = rentsArray2.toList();
    } else if (rentID2 == 1) {
      image = "assets/images/paid.png";
      rentsArray2 = rentsArray.where((e) => e.rentType == 1);
      rentsArray3 = rentsArray2.toList();
    } else if (rentID2 == 3) {
      image = "assets/images/calendar.png";
      rentsArray2 = rentsArray.where((e) => e.rentType == 3);
      rentsArray3 = rentsArray2.toList();
    } else if (rentID2 == 4) {
      image = "assets/images/dead 2.png";
      rentsArray2 = rentsArray.where((e) => e.rentType == 4);
      rentsArray3 = rentsArray2.toList();
    }
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 38, 38),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 41, 38, 38),
                        elevation: 0 // Background color
                        ),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
              ),
              itemCount: rentsArray3.length,
              itemBuilder: (_, index) {
                return Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(255, 57, 54, 54),
                  ),
                  // width: 210,
                  // height: 210,

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Colors.white),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text("${rentsArray3[index].code}",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${rentsArray3[index].lessorName}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("${rentsArray3[index].tenantName}",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${rentsArray3[index].TOR}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text("${rentsArray3[index].TOREND}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10))
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${rentsArray3[index].Start_OF_Rent}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Text("${rentsArray3[index].End_OF_Rent}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
