import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/data/repositories/rents_provider.dart';
import 'package:aman_project/models/rent.dart';
import 'package:aman_project/presentation/rents/rent_widget_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/globals.dart' as val;
import '../shared_features/custom_message.dart';

class ShowRent extends ConsumerStatefulWidget {
  const ShowRent({super.key, required this.rentType});
  final String rentType;
  @override
  ConsumerState<ShowRent> createState() => _ShowCardState();
}

class _ShowCardState extends ConsumerState<ShowRent> {
  @override
  void initState() {
    super.initState();
  }

  AsyncValue<QuerySnapshot<Map<String, dynamic>>>? getType() {
    if (widget.rentType == "DidntStart") {
      return ref.watch(didntStartSP);
    } else if (widget.rentType == "Finished") {
      return ref.watch(finishedSP);
    } else if (widget.rentType == "Payed") {
      return ref.watch(payedSP);
    } else if (widget.rentType == "DidntPay") {
      return ref.watch(didntPaySP);
    }
    return null;
  }

  // dynamic choosedRent;
  @override
  Widget build(BuildContext context) {
    String coming = ref.watch(searchInputProivderRent);

    var choosedRent = getType();
    (coming != "")
        ? choosedRent = ref.watch(searchedRents)
        : choosedRent = getType();

    try {
      return choosedRent!.when(data: (data) {
        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (context, index) {
            var rent = Rents.fromJson(data.docs[index].data());
            return RentWidget(
              rent: rent,
            );
          },
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }, error: (error, stack) {
        return Center(
          child: Text(error.toString()),
        );
      });
    } on Error catch (e) {
      print(e);
      return Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.error, color: Colors.red, size: 48),
            SizedBox(height: 16),
            Text("Something went wrong", style: TextStyle(fontSize: 24)),
          ],
        ),
      ));
    }
    // throw {
    //   errormessage("Error!", "Some Fields are Wrong!"),
    //   ScaffoldMessenger.of(context)
    //     ..hideCurrentSnackBar()
    //     ..showSnackBar(val.snackBar),
    // };
  }
}
