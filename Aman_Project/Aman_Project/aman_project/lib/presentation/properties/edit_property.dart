import 'package:aman_project/presentation/properties/property_widget_card.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '../shared_features/custom_text_field.dart';
import 'dropdown.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EditProperty extends StatefulWidget {
  PropertyWidget routeArgs;
  EditProperty({super.key, required this.routeArgs});

  @override
  State<EditProperty> createState() => _EditPropertyState();
}

class _EditPropertyState extends State<EditProperty> {
  final _ownerNameController = TextEditingController();
  final _ownerNumberController = TextEditingController();
  final _addressForUserController = TextEditingController();
  final _addressForAdminController = TextEditingController();
  final _areaController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionForUserController = TextEditingController();
  final _descriptionForAdminController = TextEditingController();
  final _nameController = TextEditingController();
  final _floorController = TextEditingController();
  final _noOFRoomsController = TextEditingController();
  final _noOFBathroomsController = TextEditingController();
  final _noOFFloorsController = TextEditingController();
  final _noOFABController = TextEditingController();
  final _noOFFlatsController = TextEditingController();
  final _typeOFActivityController = TextEditingController();

  @override
  void dispose() {
    _ownerNameController.dispose();
    _ownerNumberController.dispose();
    _addressForUserController.dispose();
    _addressForAdminController.dispose();
    _areaController.dispose();
    _priceController.dispose();
    _descriptionForUserController.dispose();
    _descriptionForAdminController.dispose();
    _nameController.dispose();
    _floorController.dispose();
    _noOFRoomsController.dispose();
    _noOFBathroomsController.dispose();
    _noOFFloorsController.dispose();
    _noOFABController.dispose();
    _noOFFlatsController.dispose();
    _typeOFActivityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _ownerNameController.text = widget.routeArgs.ownerName;
    _ownerNumberController.text = widget.routeArgs.ownerNumber;
    _addressForUserController.text = widget.routeArgs.addressUser;
    _addressForAdminController.text = widget.routeArgs.addressAdmin;
    _areaController.text = widget.routeArgs.area.toString();
    _priceController.text = widget.routeArgs.price.toString();
    _descriptionForUserController.text = widget.routeArgs.descriptionUser;
    _descriptionForAdminController.text = widget.routeArgs.descriptionAdmin;
    _nameController.text = widget.routeArgs.unitName;
    _floorController.text = widget.routeArgs.floor!;
    _noOFRoomsController.text = widget.routeArgs.noFloors!;
    _noOFBathroomsController.text = widget.routeArgs.noBarthrooms!;
    _noOFFloorsController.text = widget.routeArgs.noFloors!;
    _noOFABController.text = widget.routeArgs.theNumberOFAB!;
    _noOFFlatsController.text = widget.routeArgs.noFlats!;
    _typeOFActivityController.text = widget.routeArgs.typeOFActivity!;
    return SafeArea(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15,
          ),
          child: Column(
            children: [
              buildTextField(
                  labelText: "Owner Name",
                  hintText: "Owner Name",
                  controller: _ownerNameController,
                  type: "name"),
              buildTextField(
                  labelText: "Owner Number",
                  hintText: "01144..",
                  controller: _ownerNumberController,
                  type: "number"),
              buildTextField(
                  labelText: "Address For User",
                  hintText: "Address User",
                  controller: _addressForUserController,
                  type: "address"),
              buildTextField(
                  labelText: "Address For Admin",
                  hintText: "Address Admin",
                  controller: _addressForAdminController,
                  type: "address"),
              buildTextField(
                  labelText: "Area",
                  hintText: "Area",
                  controller: _areaController,
                  type: "number"),
              buildTextField(
                  labelText: "Price",
                  hintText: "Price",
                  controller: _priceController,
                  type: "number"),
              buildTextField(
                  labelText: "Description For User",
                  hintText: "Description For User",
                  controller: _descriptionForUserController,
                  type: "address"),
              buildTextField(
                  labelText: "Description For Admin",
                  hintText: "Description For Admin",
                  controller: _descriptionForAdminController,
                  type: "address"),
              buildTextField(
                  labelText: "Unit Name",
                  hintText: "Unit Name",
                  controller: _nameController,
                  type: "name"),
              buildTextField(
                  labelText: "Floor",
                  hintText: "Floor",
                  controller: _floorController,
                  type: "number"),
              buildTextField(
                  labelText: "Number Of Rooms",
                  hintText: "Number Of Rooms",
                  controller: _noOFRoomsController,
                  type: "number"),
              buildTextField(
                  labelText: "Number Of Bathrooms",
                  hintText: "Number Of Bathrooms",
                  controller: _noOFBathroomsController,
                  type: "number"),
              buildTextField(
                  labelText: "Number Of Floors",
                  hintText: "Number Of Floors",
                  controller: _noOFFloorsController,
                  type: "number"),
              buildTextField(
                  labelText: "Number Of Flats",
                  hintText: "Number Of Flats",
                  controller: _noOFFlatsController,
                  type: "number"),
              buildTextField(
                  labelText: "Type OF Activity",
                  hintText: "Type OF Activity",
                  controller: _typeOFActivityController,
                  type: "address"),
              buildTextField(
                  labelText: "Number Of administrative buildings",
                  hintText: "Number Of administrative buildings",
                  controller: _noOFABController,
                  type: "number"),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Payment Method'),
                    CustomDropdownButton2(
                      dropdownItems: const ["Cash", "installment"],
                      hint: "Select Payment Method",
                      value: widget.routeArgs.paymentMethod,
                      onChanged: (value) {
                        setState(() {
                          widget.routeArgs.paymentMethod = value!;
                          print(widget.routeArgs.paymentMethod);
                        });
                      },
                      validatior: (value) {
                        if (value == null) {
                          return 'Please Select';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select priority'),
                    CustomDropdownButton2(
                      dropdownItems: const ["High", "medium", "Low"],
                      hint: "Select priority",
                      value: widget.routeArgs.priority,
                      onChanged: (value) {
                        setState(() {
                          widget.routeArgs.priority = value!;
                        });
                      },
                      validatior: (value) {
                        if (value == null) {
                          return 'Please Select';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select visibility'),
                    CustomDropdownButton2(
                      dropdownItems: const ["Yes", "No"],
                      hint: "Select visibility",
                      value: widget.routeArgs.visible,
                      onChanged: (value) {
                        setState(() {
                          widget.routeArgs.visible = value!;
                        });
                      },
                      validatior: (value) {
                        if (value == null) {
                          return 'Please Select';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select offering'),
                    CustomDropdownButton2(
                      dropdownItems: const ["For Sale", "For Rent"],
                      hint: "Select offering",
                      value: widget.routeArgs.offered,
                      onChanged: (value) {
                        setState(() {
                          widget.routeArgs.offered = value!;
                        });
                      },
                      validatior: (value) {
                        if (value == null) {
                          return 'Please Select';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: widget.routeArgs.finishing!.isEmpty
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Finishing'),
                          CustomDropdownButton2(
                            dropdownItems: const ["Yes", "Half", "No"],
                            hint: "Select Finishing",
                            value: widget.routeArgs.finishing,
                            onChanged: (value) {
                              setState(() {
                                widget.routeArgs.finishing = value;
                              });
                            },
                            validatior: (value) {
                              if (value == null) {
                                return 'Please Select';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: widget.routeArgs.doublex!.isEmpty
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Select yes if Doublex'),
                          CustomDropdownButton2(
                            dropdownItems: const ["Yes", "No"],
                            hint: "Select yes if Doublex",
                            value: widget.routeArgs.doublex,
                            onChanged: (value) {
                              setState(() {
                                widget.routeArgs.doublex = value;
                              });
                            },
                            validatior: (value) {
                              if (value == null) {
                                return 'Please Select';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: widget.routeArgs.furnished!.isEmpty
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Select yes if Furnished'),
                          CustomDropdownButton2(
                            dropdownItems: const ["Yes", "No"],
                            hint: "Select yes if Furnished",
                            value: widget.routeArgs.furnished,
                            onChanged: (value) {
                              setState(() {
                                widget.routeArgs.furnished = value;
                              });
                            },
                            validatior: (value) {
                              if (value == null) {
                                return 'Please Select';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Padding buildTextField(
      {required String labelText,
      required String hintText,
      required TextEditingController controller,
      required String type}) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
      child: type == 'number'
          ? controller.text.isEmpty
              ? const SizedBox()
              : CustomTextField(
                  controller: controller,
                  obscureText: false,
                  labelText: labelText,
                  hintText: hintText,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (!value!.isValidNumber) {
                      return 'Please enter a valid $labelText';
                    }
                    return null;
                  },
                )
          : controller.text.isEmpty
              ? const SizedBox()
              : CustomTextField(
                  controller: controller,
                  obscureText: false,
                  labelText: labelText,
                  hintText: hintText,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  validator: (value) {
                    if (type == 'name') {
                      if (!value!.isValidName) {
                        return 'Please enter a valid $labelText';
                      }
                      return null;
                    }
                    if (type == 'address') {
                      if (!value!.isValidAddress) {
                        return 'Please enter a valid $labelText';
                      }
                      return null;
                    }
                    return null;
                  },
                ),
    );
  }
}
