import 'package:aman_project/models/rent.dart';
import 'package:aman_project/presentation/rents/rent_card.dart';
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
      child: CardRent(rent: rent, rentTypeColor: rentTypeColor),
    );
  }
}
