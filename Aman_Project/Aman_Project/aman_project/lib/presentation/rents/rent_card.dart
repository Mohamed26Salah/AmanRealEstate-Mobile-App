import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/models/rent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardRent extends StatelessWidget {
  const CardRent({
    Key? key,
    required this.rent,
    required this.rentTypeColor,
  }) : super(key: key);

  final Rents rent;
  final Color? rentTypeColor;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: rent.docId.toString(),
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.only(bottom: 24),
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Container(
          height: 210,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/rent.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: 80,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Center(
                    child: Text(
                      rent.type.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: rentTypeColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  width: 80,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Center(
                    child: Text(
                      rent.rentType.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                    // flex: 1,
                    child: Center(
                        child: Text(
                  overflow: TextOverflow.ellipsis,
                  '${RentsManagement.figureHowManyDaysLeft(rent.startOFRent, rent.endOFRent, rent.tor, rent.torEnd, rent.rentType)} ${"Days".tr}',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ))),
                // Expanded(
                //   child: Container(),
                // ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              rent.lessorName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            rent.tenantName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Center(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        rent.rentPrice.toString() + r" LE",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
