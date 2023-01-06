import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/data/repositories/rents_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RentsPage extends ConsumerStatefulWidget {
  const RentsPage({super.key});

  @override
  ConsumerState<RentsPage> createState() => _RentsPageState();
}

class _RentsPageState extends ConsumerState<RentsPage> {
  late bool rentsButton;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _getRentsData(RoundedLoadingButtonController controller) async {
    await RentsManagement.updateRentsType();
    controller.success();
    ref.read(rentsButtonProivder.notifier).state = true;
    // Timer(const Duration(seconds: 5), () {
    //   controller.success();
    //   ref.read(rentsButtonProivder.notifier).state = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    rentsButton = ref.watch(rentsButtonProivder);
    return Scaffold(
      body: (rentsButton)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Rents",
                  style: TextStyle(fontSize: 70),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SalahCard(
                            image: "assets/images/validating-ticket.png",
                            text: "Paid"),
                        SalahCard(
                            image: "assets/images/paper-money.png",
                            text: "No Paid"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SalahCard(
                            image: "assets/images/contract.png",
                            text: "New Contract"),
                        SalahCard(
                            image: "assets/images/no.png",
                            text: "Expired contract"),
                      ],
                    ),
                  ],
                ),
              ],
            )
          : Center(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/house.png", width: 100),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Update Rents Data',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    RoundedLoadingButton(
                      color: const Color.fromARGB(255, 205, 153, 51),
                      controller: _btnController,
                      onPressed: () => _getRentsData(_btnController),
                      child: const Text('Gets Rents Data!'),
                    )
                  ],
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/addFormRent');
          // context.push('/addFormUnits');
        },
      ),
    );
  }
}

class SalahCard extends StatefulWidget {
  String image;
  String text;
  SalahCard({
    required this.image,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<SalahCard> createState() => _SalahCardState();
}

class _SalahCardState extends State<SalahCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
          onTap: () {
            if (true) {
              setState(() {});
            }
          },
          highlightColor: Theme.of(context).highlightColor,
          splashColor: Theme.of(context).primaryColor,
          // focusColor: Colors.green.withOpacity(0.0),
          // hoverColor: Colors.blue.withOpacity(0.8),
          child: Container(
              width: (MediaQuery.of(context).size.width / 2) - 30,
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(widget.image, width: 100),
                  Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ))),
    );
  }
}
