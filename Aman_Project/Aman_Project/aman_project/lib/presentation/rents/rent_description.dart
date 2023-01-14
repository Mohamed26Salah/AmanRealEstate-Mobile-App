import 'package:aman_project/common_widgets/property_details.dart';
import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/models/rent.dart';
import 'package:aman_project/presentation/rents/rent_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:no_glow_scroll/no_glow_scroll.dart';

class RentsDescription extends ConsumerStatefulWidget {
  const RentsDescription({super.key});

  @override
  ConsumerState<RentsDescription> createState() => _RentsDescriptionState();
}

class _RentsDescriptionState extends ConsumerState<RentsDescription> {
  @override
  Widget build(BuildContext context) {
    Rents routeArgs = ModalRoute.of(context)!.settings.arguments as Rents;

    Color? rentTypeColor;
    if (routeArgs.rentType == "Payed") {
      rentTypeColor = Colors.green;
    }
    if (routeArgs.rentType == 'DidntPay') {
      rentTypeColor = Colors.red;
    }
    if (routeArgs.rentType == 'Finished') {
      rentTypeColor = Colors.black;
    }
    if (routeArgs.rentType == 'DidntStart') {
      rentTypeColor = Colors.yellow[700];
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: NoGlowScroll(
                child: SingleChildScrollView(
                  child: Hero(
                    tag: routeArgs,
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.only(bottom: 24),
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
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
                                    routeArgs.type,
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
                                    routeArgs.rentType,
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
                                    '${RentsManagement.figureHowManyDaysLeft(routeArgs.startOFRent, routeArgs.endOFRent, routeArgs.tor, routeArgs.torEnd, routeArgs.rentType)} Days',
                                    style: TextStyle(
                                        fontSize: 45,
                                        color: Theme.of(context)
                                            .primaryColorLight),
                                  ))),
                              Expanded(
                                child: Container(),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            routeArgs.lessorName,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          routeArgs.tenantName,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColorLight,
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
                                      r"$" + routeArgs.rentPrice.toString(),
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorLight,
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
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: NoGlowScroll(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Owner Number".tr,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      // PropertyManagement.makePhoneCall(
                                      //     context: context,
                                      //     isVisible: isVisible,
                                      //     routeArgs: routeArgs);
                                    },
                                    child: Icon(
                                      Icons.phone,
                                      color: Theme.of(context).primaryColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24, left: 24),
                      child: SizedBox(
                        height: 100,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            ExtractedWidgets().buildFeature(
                                Icons.date_range,
                                routeArgs.endOFRent.toString(),
                                "End Of Rent",
                                context),
                            ExtractedWidgets().buildFeature(
                                Icons.date_range,
                                routeArgs.startOFRent.toString(),
                                "Start Of Rent",
                                context),
                            ExtractedWidgets().buildFeature(
                                Icons.date_range,
                                routeArgs.tor.toString(),
                                "Time Of Rent",
                                context),
                            ExtractedWidgets().buildFeature(
                                Icons.date_range,
                                routeArgs.torEnd.toString(),
                                "End Time Of Rent",
                                context),
                            ExtractedWidgets().buildFeature(Icons.house,
                                routeArgs.furnished, "Furnished", context),
                            ExtractedWidgets().buildFeature(Icons.stairs,
                                routeArgs.floor, "Floor", context),
                            ExtractedWidgets().buildFeature(
                                Icons.domain_outlined,
                                routeArgs.finishing,
                                "Finishing",
                                context),
                          ],
                        ),
                      ),
                    ),
                    RentDetails(routeArgs: routeArgs),

                    // ExtractedWidgets()
                    //     .deleteButton(isVisible, context, routeArgs)
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.edit),
          onPressed: () async {
            // await Navigator.of(context)
            //     .pushNamed('/editProperty', arguments: routeArgs)
            //     .then((value) {
            //   ImageManagement().clearImageProivders(ref);
            //   routeArgs = value as Property;

            //   setState(() {});
            // });
          },
        ),
      ),
    );
  }
}


