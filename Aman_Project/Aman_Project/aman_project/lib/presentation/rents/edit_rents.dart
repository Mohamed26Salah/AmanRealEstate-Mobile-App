import 'package:aman_project/data/form_management.dart';
import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/models/rent.dart';
import 'package:aman_project/presentation/shared_features/custom_loading_screen.dart';
import 'package:aman_project/presentation/shared_features/custom_message.dart';
import 'package:aman_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
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
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
                            elevation: 0 // Background color
                            ),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Theme.of(context).backgroundColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Text(
                    "Edit Rent".tr,
                    style: const TextStyle(
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
                hint: "Select Type".tr,
                text: "Select Type".tr,
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
                  labelText: "Price".tr,
                  hintText: "Price".tr,
                  controller: _rentPriceController,
                  type: "number",
                  show: true,
                  context: context),
              FormManagement.buildTextField(
                  labelText: "Area".tr,
                  hintText: "Area".tr,
                  controller: _areaController,
                  type: "number",
                  show: true,
                  context: context),
              FormManagement.buildTextField(
                  labelText: "Floor".tr,
                  hintText: "Floor".tr,
                  controller: _floorController,
                  type: "number",
                  show: true,
                  context: context),
              FormManagement.buildTextField(
                  labelText: "Lessor Name".tr,
                  hintText: "Lessor Name".tr,
                  controller: _lessorNameController,
                  type: "name",
                  show: true,
                  context: context),
              FormManagement.buildTextField(
                  labelText: "Lessor Number".tr,
                  hintText: "01144..",
                  controller: _lessorNumController,
                  type: "phone",
                  show: true,
                  context: context),
              FormManagement.buildTextField(
                  labelText: "Tenant Name".tr,
                  hintText: "Tenant Name".tr,
                  controller: _tenantNameController,
                  type: "name",
                  show: true,
                  context: context),
              FormManagement.buildTextField(
                  labelText: "Tenant Number".tr,
                  hintText: "01144..",
                  controller: _tenantNumController,
                  type: "phone",
                  show: true,
                  context: context),
              FormManagement.buildTextField(
                  labelText: "Description".tr,
                  hintText: "Description".tr,
                  controller: _descriptionController,
                  type: "address",
                  show: true,
                  context: context),
              FormManagement.showDropdown(
                dropdownItems: ["Yes", "No"],
                hint: "Select yes if Furnished".tr,
                text: "Select yes if Furnished".tr,
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
                hint: "Select Finishing".tr,
                text: "Select Finishing".tr,
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
                child: Text('Change Rent Date?'.tr),
              ),

              AbsorbPointer(
                absorbing: changeRentDate,
                child: buildDatePicker(startOFRent, 'Start Of Contract'.tr,
                    startOFRentVisilbe, disabledColor),
              ),
              AbsorbPointer(
                absorbing: changeRentDate,
                child: buildDatePicker(endOFRent, 'End Of Contract'.tr,
                    endOFRentVisible, disabledColor),
              ),
              AbsorbPointer(
                absorbing: changeRentDate,
                child: buildDatePicker(
                    tor, 'Start Of Rent'.tr, torVisibile, disabledColor),
              ),
              AbsorbPointer(
                absorbing: changeRentDate,
                child: buildDatePicker(
                    torEnd, 'End Of Rent'.tr, torEndVisibile, disabledColor),
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
                        errormessage(
                            "Error".tr, "Please Put all Dates Right".tr);
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
                    child: Center(
                      child: Text(
                        'Submit'.tr,
                        style: const TextStyle(
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
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10),
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
                        foregroundColor: blackColor),
                    onPressed: () async {
                      if (name == "Start Of Contract".tr) {
                        initialDate = DateTime.now();
                        dateConstrainLeast = DateTime(DateTime.now().year - 10);
                        dateConstrainMost = DateTime(DateTime.now().year + 25);
                      }
                      if (name == "End Of Contract".tr) {
                        initialDate = startOFRent;
                        dateConstrainLeast = startOFRent;
                        dateConstrainMost = DateTime(DateTime.now().year + 25);
                      }
                      if (name == "Start Of Rent".tr) {
                        initialDate = startOFRent;
                        dateConstrainLeast = startOFRent;
                        dateConstrainMost = endOFRent;
                      }
                      if (name == "End Of Rent".tr) {
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
                        if (name == "Start Of Contract".tr) {
                          startOFRent = newDateTime;
                        }
                        if (name == "End Of Contract".tr) {
                          endOFRent = newDateTime;
                        }
                        if (name == "Start Of Rent".tr) {
                          tor = newDateTime;
                        }
                        if (name == "End Of Rent".tr) {
                          torEnd = newDateTime;
                        }
                        updateVisibility();
                      });
                    },
                    child: Text('Select Date'.tr)),
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
