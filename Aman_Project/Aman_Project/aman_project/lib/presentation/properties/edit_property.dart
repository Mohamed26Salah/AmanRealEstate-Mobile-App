import 'package:aman_project/presentation/properties/property_widget_card.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '../shared_features/custom_text_field.dart';
import 'dropdown.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EditProperty extends StatefulWidget {

  PropertyWidget routeArgs;
   EditProperty({
    super.key,
    required this.routeArgs
  });

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
    _areaController.text = widget.routeArgs.area;
    _priceController.text = widget.routeArgs.price;
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
                bottom: MediaQuery.of(context).viewInsets.bottom+ 15,
              ),
              child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  
                  controller: _ownerNameController,
                  obscureText: false,
                  labelText: "Owner Name",
                  hintText: widget.routeArgs.ownerName,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(
                  //     RegExp(r"[a-zA-Z]+|\s"),
                  //   )
                  // ],
                  validator: (value) {
                    if (!value!.isValidName) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _ownerNumberController,
                  obscureText: false,
                  labelText: "Owner Number",
                  hintText: "01144..",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (!value!.isValidPhone) {
                      return 'Please enter a valid Number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _addressForUserController,
                  obscureText: false,
                  labelText: "Address For User",
                  hintText: "Address User",
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(
                  //     RegExp(r"[a-zA-Z]+|\s"),
                  //   )
                  // ],
                  validator: (value) {
                    if (!value!.isValidAddress) {
                      return 'Please enter a valid Address';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _addressForAdminController,
                  obscureText: false,
                  labelText: "Address For Admin",
                  hintText: "Address Admin",
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(
                  //     RegExp(r"[a-zA-Z]+|\s"),
                  //   )
                  // ],
                  validator: (value) {
                    if (!value!.isValidAddress) {
                      return 'Please enter a valid Address';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _areaController,
                  obscureText: false,
                  labelText: "Area",
                  hintText: "Area",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (!value!.isValidNumber) {
                      return 'Please enter a valid Number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _priceController,
                  obscureText: false,
                  labelText: "Price",
                  hintText: "Price",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (!value!.isValidNumber) {
                      return 'Please enter a valid Number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _descriptionForUserController,
                  obscureText: false,
                  labelText: "Description For User",
                  hintText: "Description User",
                  validator: (value) {
                    if (!value!.isValidAddress) {
                      return 'Please enter a valid Description';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _descriptionForAdminController,
                  obscureText: false,
                  labelText: "Description For Admin",
                  hintText: "Description Admin",
                  validator: (value) {
                    if (!value!.isValidAddress) {
                      return 'Please enter a valid Description';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _nameController,
                  obscureText: false,
                  labelText: "Unit Name",
                  hintText: "Unit Name",
                  validator: (value) {
                    if (!value!.isValidAddress) {
                      return 'Please enter a valid Unit Name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _floorController,
                  obscureText: false,
                  labelText: "Floor",
                  hintText: "Floor",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (!value!.isValidNumber) {
                      return 'Please enter a valid Number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _noOFRoomsController,
                  obscureText: false,
                  labelText: "Number Of Rooms",
                  hintText: "Number Of Rooms",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (!value!.isValidNumber) {
                      return 'Please enter a valid Number';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _noOFBathroomsController,
                  obscureText: false,
                  labelText: "Number Of Bathrooms",
                  hintText: "Number Of Bathrooms",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (!value!.isValidNumber) {
                      return 'Please enter a valid Number';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _noOFFloorsController,
                  obscureText: false,
                  labelText: "Number Of Floors",
                  hintText: "Number Of Floors",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (!value!.isValidNumber) {
                      return 'Please enter a valid Number';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _noOFABController,
                  obscureText: false,
                  labelText: "Number Of administrative buildings",
                  hintText: "Number Of administrative buildings",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (!value!.isValidNumber) {
                      return 'Please enter a valid Number';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _noOFFlatsController,
                  obscureText: false,
                  labelText: "Number Of Flats",
                  hintText: "Number Of Flats",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (!value!.isValidNumber) {
                      return 'Please enter a valid Number';
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: CustomTextField(
                  controller: _typeOFActivityController,
                  obscureText: false,
                  labelText: "Type OF Activity",
                  hintText: "Type OF Activity",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(25),
                  ],
                  validator: (value) {
                    if (!value!.isValidAddress) {
                      return 'Please enter a valid Type of Activity';
                    }

                    return null;
                  },
                ),
              ),
          ],
        ),
            )),
      ),
    );
  }
}
