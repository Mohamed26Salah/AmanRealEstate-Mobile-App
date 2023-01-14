import 'package:aman_project/models/rent.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class RentDetails extends StatelessWidget {
  const RentDetails({
    Key? key,
    required this.routeArgs,
  }) : super(key: key);

  final Rents routeArgs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Text(
            'Area'.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Text(
            '${routeArgs.area} sq/m',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Text(
            'Description'.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Text(
            routeArgs.description,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Text(
            'Lessor Name'.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Text(
            routeArgs.lessorName,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Text(
            'Lessor Number'.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Text(
            routeArgs.lessorNum,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Text(
            'Tenant Name'.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Text(
            routeArgs.tenantName,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Text(
            'Tenant Number'.tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Text(
            routeArgs.tenantNum,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }
}