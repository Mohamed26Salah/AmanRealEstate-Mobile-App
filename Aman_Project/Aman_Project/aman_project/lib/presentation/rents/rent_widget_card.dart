import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/models/rent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class RentWidget extends StatelessWidget {
  Rents rent;

  Color? color = Colors.yellow[700];
  final CacheManager cacheManager = CacheManager(Config('images_key',
      maxNrOfCacheObjects: 100, stalePeriod: const Duration(days: 1)));

  RentWidget({
    super.key,
    required this.rent,
  });

  selectedRent(BuildContext context) {
    Navigator.of(context).pushNamed('/rentDetails', arguments: rent);
  }

  @override
  Widget build(BuildContext context) {
    Color? rentTypeColor;
    if (rent.rentType == "Payed") {
      rentTypeColor = Colors.green;
    }
    if (rent.rentType == 'DidntPay') {
      rentTypeColor = Colors.red;
    }
    if (rent.rentType == 'Finished') {
      rentTypeColor = Colors.black;
    }
    if (rent.rentType == 'DidntStart') {
      rentTypeColor = Colors.yellow[700];
    }

    return GestureDetector(
      onTap: () => selectedRent(context),
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
            // borderRadius: BorderRadius.circular(15),
            // boxShadow: [
            //   BoxShadow(
            //     spreadRadius: 2,
            //     blurRadius: 10,
            //     color: Colors.black.withOpacity(0.1),
            //   ),
            // ],
            // shape: BoxShape.rectangle,
            image: DecorationImage(
              // image: NetworkImage(mainImage),
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
                      rent.type,
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
                      rent.rentType,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                    flex: 7,
                    child: Center(
                        child: Text(
                      overflow: TextOverflow.ellipsis,
                      '${RentsManagement.figureHowManyDaysLeft(rent.startOFRent, rent.endOFRent, rent.tor, rent.torEnd, rent.rentType)} Days',
                      style: TextStyle(
                          fontSize: 45,
                          color: Theme.of(context).primaryColorLight),
                    ))),
                Expanded(
                  child: Container(),
                ),
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
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
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
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
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
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     // Row(
                    //     //   children: [
                    //      Icon(
                    //       Icons.phone,
                    //       color: Theme.of(context).primaryColorLight,
                    //       size: 14,
                    //     ),
                    //     // const SizedBox(
                    //     //   width: 4,
                    //     // ),
                    //     Flexible(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(right: 5),
                    //         child: Text(
                    //           overflow: TextOverflow.ellipsis,
                    //           rent.tenantNum,
                    //           style:  TextStyle(
                    //             color: Theme.of(context).primaryColorLight,
                    //             fontSize: 14,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 15,
                    //     ),
                    //      Icon(
                    //       Icons.zoom_out_map,
                    //       color: Theme.of(context).primaryColorLight,
                    //       size: 16,
                    //     ),
                    //     // const SizedBox(
                    //     //   width: 4,
                    //     // ),
                    //     Text(
                    //       "${rent.area} sq/m",
                    //       style:  TextStyle(
                    //         color: Theme.of(context).primaryColorLight,
                    //         fontSize: 14,
                    //       ),
                    //     ),
                    //     //   ],
                    //     // ),
                    //   ],
                    // ),

                    Center(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        r"$" + rent.rentPrice.toString(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
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
