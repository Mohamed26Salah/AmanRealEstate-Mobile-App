import 'package:aman_project/models/property.dart';
import 'package:flutter/material.dart';

class AddFormRent extends StatefulWidget {
  const AddFormRent({super.key});

  @override
  State<AddFormRent> createState() => _AddFormRentState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _AddFormRentState extends State<AddFormRent> {
  final _rentPriceController = TextEditingController();
  final _areaController = TextEditingController();
  final _floorController = TextEditingController();
  final _lessorNameController = TextEditingController();
  final _lessorNumController = TextEditingController();
  final _tenantNameController = TextEditingController();
  final _tenantNumController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? finishing;
  String? furnished;
  String? type;
  DateTime tor = DateTime(2022, 12, 30);
  DateTime torEnd = DateTime(2022, 12, 30);
  DateTime startOFRent = DateTime(2022, 12, 30);
  DateTime endOFRent = DateTime(2022, 12, 30);
  @override
  Widget build(BuildContext context) {
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
                    "Still Under Construction",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Property.showDropdown(
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
                value: type,
                onChanged: (value) {
                  setState(() {
                    type = value;
                  });
                },
              ),
              Property.buildTextField(
                  labelText: "price",
                  hintText: "price",
                  controller: _rentPriceController,
                  type: "price",
                  show: true),
              Property.buildTextField(
                  labelText: "Area",
                  hintText: "Area",
                  controller: _areaController,
                  type: "number",
                  show: true),
              Property.buildTextField(
                  labelText: "Floor",
                  hintText: "Floor",
                  controller: _floorController,
                  type: "number",
                  show: true),
              Property.buildTextField(
                  labelText: "Lessor Name",
                  hintText: "Lessor Name",
                  controller: _lessorNameController,
                  type: "name",
                  show: true),
              Property.buildTextField(
                  labelText: "Lessor Number",
                  hintText: "01144..",
                  controller: _lessorNumController,
                  type: "phone",
                  show: true),
              Property.buildTextField(
                  labelText: "Tenant Name",
                  hintText: "Tenant Name",
                  controller: _tenantNameController,
                  type: "name",
                  show: true),
              Property.buildTextField(
                  labelText: "Tenant Number",
                  hintText: "01144..",
                  controller: _tenantNumController,
                  type: "phone",
                  show: true),
              Property.buildTextField(
                  labelText: "Description",
                  hintText: "Description",
                  controller: _descriptionController,
                  type: "address",
                  show: true),
              Property.showDropdown(
                dropdownItems: ["Yes", "No"],
                hint: "Select yes if Furnished",
                text: "Select yes if Furnished",
                show: true,
                value: furnished,
                onChanged: (value) {
                  setState(() {
                    furnished = value;
                  });
                },
              ),
              Property.showDropdown(
                dropdownItems: ["Yes", "Half", "No"],
                hint: "Select Finishing",
                text: "Select Finishing",
                show: true,
                value: finishing,
                onChanged: (value) {
                  setState(() {
                    finishing = value;
                  });
                },
              ),
              Text(
                '${tor.year}/${tor.month}/${tor.day}',
                style: const TextStyle(fontSize: 32),
              ),
              ElevatedButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: tor,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    if (newDate == null) return;
                    setState(() {
                      tor = newDate;
                    });
                  },
                  child: const Text('Select Date'))
            ],
          ))),
        ),
      ),
    );
  }
}
