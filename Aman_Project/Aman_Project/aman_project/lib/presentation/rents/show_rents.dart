import 'package:aman_project/data/repositories/rents_provider.dart';
import 'package:aman_project/models/rent.dart';
import 'package:aman_project/presentation/rents/rent_widget_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../shared_features/custom_loading_screen.dart';
import 'package:get/get.dart';

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

  @override
  void dispose() {
    super.dispose();
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
        Future.delayed(const Duration(milliseconds: 100), () {
          ref.read(resultsCountRent.notifier).state = data.size;
        });
        return (data.size != 0)
            ? ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  var rent = Rents.fromJson(
                      data.docs[index].data(), data.docs[index].id);
                  return RentWidget(
                    rent: rent,
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/NotFound.png", width: 100),
                    const SizedBox(height: 15),
                    Text(
                      'No Data is Found'.tr,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
      }, loading: () {
        return const Center(
          child: LoadingScreen(),
        );
      }, error: (error, stack) {
        return Center(
          child: Text(error.toString()),
        );
      });
    } on Error catch (e) {
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
