import 'package:aman_project/data/form_management.dart';
import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/models/rent.dart';
import 'package:aman_project/presentation/shared_features/custom_loading_screen.dart';
import 'package:aman_project/presentation/shared_features/custom_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import '../../constants/globals.dart' as val;

class EditRents extends StatefulWidget {
  const EditRents({super.key});

  @override
  State<EditRents> createState() => _EditRentsState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _EditRentsState extends State<EditRents> {
  final _rentPriceController = TextEditingController();
  final _areaController = TextEditingController();
  final _floorController = TextEditingController();
  final _lessorNameController = TextEditingController();
  final _lessorNumController = TextEditingController();
  final _tenantNameController = TextEditingController();
  final _tenantNumController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime startOFRent = DateTime(2000, 01, 01);
  DateTime endOFRent = DateTime(2000, 01, 01);
  DateTime tor = DateTime(2000, 01, 01);
  DateTime torEnd = DateTime(2000, 01, 01);
  bool startOFRentVisilbe = true;
  bool endOFRentVisible = true;
  bool torVisibile = true;
  bool torEndVisibile = true;
  String rentType = "";
  int counter = 0;
  bool changeRentDate = true;

  @override
  void dispose() {
    _rentPriceController.dispose();
    _areaController.dispose();
    _floorController.dispose();
    _lessorNameController.dispose();
    _lessorNumController.dispose();
    _tenantNameController.dispose();
    _tenantNumController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Rents routeArgs = ModalRoute.of(context)!.settings.arguments as Rents;
    Color disabledColor;
    changeRentDate == true
        ? disabledColor = Colors.grey[300]!
        : disabledColor = Theme.of(context).primaryColor;
    if (counter++ == 0) {
      _rentPriceController.text = routeArgs.rentPrice.toString();
      _areaController.text = routeArgs.area.toString();
      _floorController.text = routeArgs.floor;
      _lessorNameController.text = routeArgs.lessorName;
      _lessorNumController.text = routeArgs.lessorNum;
      _tenantNameController.text = routeArgs.tenantName;
      _tenantNumController.text = routeArgs.tenantNum;
      _descriptionController.text = routeArgs.description;
      startOFRent = routeArgs.startOFRent;
      endOFRent = routeArgs.endOFRent;
      tor = routeArgs.tor;
      torEnd = routeArgs.torEnd;
      rentType = routeArgs.rentType;
    }

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   shadowColor: Colors.white,
      //   elevation: 0,

      // ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        elevation: 0 // Background color
                        ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "Add Rent",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              FormManagement.showDropdown(
                dropdownItems: [
                  "Flat",
                  "Villa",
                  "Building",
                  "Store",
                  "Clinic",
                  "Factory",
                  "Farm",
                  "Land",
                  "Other"
                ],
                hint: "Select Type",
                text: "Select Type",
                show: true,
                value: routeArgs.type,
                context: context,
                onChanged: (value) {
                  setState(() {
                    routeArgs.type = value!;
                  });
                },
              ),
              FormManagement.buildTextField(
                  labelText: "price",
                  hintText: "price",
                  controller: _rentPriceController,
                  type: "number",
                  show: true),
              FormManagement.buildTextField(
                  labelText: "Area",
                  hintText: "Area",
                  controller: _areaController,
                  type: "number",
                  show: true),
              FormManagement.buildTextField(
                  labelText: "Floor",
                  hintText: "Floor",
                  controller: _floorController,
                  type: "number",
                  show: true),
              FormManagement.buildTextField(
                  labelText: "Lessor Name",
                  hintText: "Lessor Name",
                  controller: _lessorNameController,
                  type: "name",
                  show: true),
              FormManagement.buildTextField(
                  labelText: "Lessor Number",
                  hintText: "01144..",
                  controller: _lessorNumController,
                  type: "phone",
                  show: true),
              FormManagement.buildTextField(
                  labelText: "Tenant Name",
                  hintText: "Tenant Name",
                  controller: _tenantNameController,
                  type: "name",
                  show: true),
              FormManagement.buildTextField(
                  labelText: "Tenant Number",
                  hintText: "01144..",
                  controller: _tenantNumController,
                  type: "phone",
                  show: true),
              FormManagement.buildTextField(
                  labelText: "Description",
                  hintText: "Description",
                  controller: _descriptionController,
                  type: "address",
                  show: true),
              FormManagement.showDropdown(
                dropdownItems: ["Yes", "No"],
                hint: "Select yes if Furnished",
                text: "Select yes if Furnished",
                show: true,
                value: routeArgs.furnished,
                context: context,
                onChanged: (value) {
                  setState(() {
                    routeArgs.furnished = value!;
                  });
                },
              ),
              FormManagement.showDropdown(
                dropdownItems: ["Yes", "Half", "No"],
                hint: "Select Finishing",
                text: "Select Finishing",
                show: true,
                value: routeArgs.finishing,
                context: context,
                onChanged: (value) {
                  setState(() {
                    routeArgs.finishing = value!;
                  });
                },
              ),
              //Pause Until User Press Update
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () async {
                  setState(() {
                    startOFRentVisilbe = true;
                    endOFRentVisible = false;
                    torVisibile = false;
                    torEndVisibile = false;
                    changeRentDate = false;
                    startOFRent = DateTime(2000, 01, 01);
                    endOFRent = DateTime(2000, 01, 01);
                    tor = DateTime(2000, 01, 01);
                    torEnd = DateTime(2000, 01, 01);
                  });
                },
                child: const Text('Change Rent Date?'),
              ),

              AbsorbPointer(
                absorbing: changeRentDate,
                child: buildDatePicker(startOFRent, 'StartOFRent',
                    startOFRentVisilbe, disabledColor),
              ),
              AbsorbPointer(
                absorbing: changeRentDate,
                child: buildDatePicker(
                    endOFRent, 'EndOFRent', endOFRentVisible, disabledColor),
              ),
              AbsorbPointer(
                absorbing: changeRentDate,
                child: buildDatePicker(tor, 'TOR', torVisibile, disabledColor),
              ),
              AbsorbPointer(
                absorbing: changeRentDate,
                child: buildDatePicker(
                    torEnd, 'TOR-END', torEndVisibile, disabledColor),
              ),
              // buildDatePicker(startOFRent, 'StartOFRent', startOFRentVisilbe),
              // buildDatePicker(endOFRent, 'EndOFRent', endOFRentVisible),
              // buildDatePicker(tor, 'TOR', torVisibile),
              // buildDatePicker(torEnd, 'TOR-END', torEndVisibile),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 20),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 15, right: 15, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (tor != DateTime(2000, 01, 01) ||
                          torEnd != DateTime(2000, 01, 01) ||
                          startOFRent != DateTime(2000, 01, 01) ||
                          endOFRent != DateTime(2000, 01, 01)) {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: LoadingScreen(),
                                );
                              });
                          rentType = RentsManagement.figureRentType(
                              startOFRent, endOFRent, tor, torEnd);
                          await RentsManagement.editRent(
                              docId: routeArgs.docId!,
                              rentPrice: routeArgs.rentPrice =
                                  int.parse(_rentPriceController.text),
                              type: routeArgs.type = routeArgs.type,
                              area: routeArgs.area =
                                  int.parse(_areaController.text),
                              floor: routeArgs.floor = routeArgs.floor,
                              lessorName: routeArgs.lessorName =
                                  _lessorNameController.text,
                              tenantName: routeArgs.tenantName =
                                  _tenantNameController.text,
                              lessorNum: routeArgs.lessorNum =
                                  _lessorNumController.text,
                              tenantNum: routeArgs.tenantNum =
                                  _tenantNumController.text,
                              description: routeArgs.description =
                                  _descriptionController.text,
                              furnished: routeArgs.furnished =
                                  routeArgs.furnished,
                              finishing: routeArgs.finishing =
                                  routeArgs.finishing,
                              tor: routeArgs.tor = tor,
                              torEnd: routeArgs.torEnd = torEnd,
                              startOFRent: routeArgs.startOFRent = startOFRent,
                              endOFRent: routeArgs.endOFRent = endOFRent,
                              rentType: routeArgs.rentType = rentType);
                          if (!mounted) return;
                          Navigator.pop(context, routeArgs);
                          Navigator.pop(context, routeArgs);
                        }
                      } else {
                        errormessage("Error!", "Please Put all Dates Right!");
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(val.snackBar);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Colors.red.withOpacity(0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ))),
        ),
      ),
    );
  }

  Widget buildDatePicker(
      DateTime date, String name, bool visible, Color disabledColor) {
    DateTime? initialDate;
    DateTime? dateConstrainLeast;
    DateTime? dateConstrainMost;
    return Visibility(
      visible: visible,
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 25),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 205, 153, 51), spreadRadius: 2),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${date.year}/${date.month}/${date.day}',
                  style: const TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: disabledColor,
                    ),
                    onPressed: () async {
                      if (name == "StartOFRent") {
                        initialDate = DateTime.now();
                        dateConstrainLeast = DateTime(DateTime.now().year - 10);
                        dateConstrainMost = DateTime(DateTime.now().year + 25);
                      }
                      if (name == "EndOFRent") {
                        initialDate = startOFRent;
                        dateConstrainLeast = startOFRent;
                        dateConstrainMost = DateTime(DateTime.now().year + 25);
                      }
                      if (name == "TOR") {
                        initialDate = startOFRent;
                        dateConstrainLeast = startOFRent;
                        dateConstrainMost = endOFRent;
                      }
                      if (name == "TOR-END") {
                        initialDate = tor;
                        dateConstrainLeast = tor;
                        dateConstrainMost = endOFRent;
                      }
                      DateTime? newDateTime = await showRoundedDatePicker(
                        context: context,
                        initialDate: initialDate,
                        firstDate: dateConstrainLeast,
                        lastDate: dateConstrainMost,
                        borderRadius: 16,
                        theme: ThemeData.dark(),
                      );

                      if (newDateTime == null) return;
                      setState(() {
                        date = newDateTime;
                        if (name == "StartOFRent") {
                          startOFRent = newDateTime;
                        }
                        if (name == "EndOFRent") {
                          endOFRent = newDateTime;
                        }
                        if (name == "TOR") {
                          tor = newDateTime;
                        }
                        if (name == "TOR-END") {
                          torEnd = newDateTime;
                        }
                        updateVisibility();
                      });
                    },
                    child: const Text('Select Date')),
              ],
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  updateVisibility() {
    if (!startOFRent.isAtSameMomentAs(DateTime(2000, 01, 01))) {
      endOFRentVisible = true;
      if (!endOFRent.isAtSameMomentAs(DateTime(2000, 01, 01))) {
        torVisibile = true;
        if (!tor.isAtSameMomentAs(DateTime(2000, 01, 01))) {
          torEndVisibile = true;
        }
      }
    }
  }
}
