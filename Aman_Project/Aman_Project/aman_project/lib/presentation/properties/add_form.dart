import 'package:aman_project/models/property_managemnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../shared_features/custom_message.dart';
import 'dropdown.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

import '../shared_features/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import '../../constants/globals.dart' as val;

//Removed Final
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AddForm extends StatefulWidget {
  AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => AddFormState();
}

class AddFormState extends State<AddForm> {
  //List For add
  List<dynamic> listAddTOFirebase = [];
  String userChoice = "";
  //Resposbile of Visibility of widgets
  bool visibleFinishing = false;
  bool visibleDoublex = false;
  bool visibleFurnished = false;
  bool visibleFloor = false;
  bool visibleNoRooms = false;
  bool visibleNOBathrooms = false;
  bool visibleNOFloors = false;
  bool visibleNoAB = false;
  bool visibleNOFlats = false;
  bool visibleTypeOFAcitivity = false;
  //Controller and value holders
  String? paymentMethod;
  String? priority;
  String? visible;
  String? offered;
  String? type;
  String? finishing;
  String? doublex;
  String? furnished;
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
  //Upload Image and Multi Images
  File? myImage;
  late String singleImageURl;
  List<File> images = [];
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
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        "Add",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Select The type",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  CustomRadioButton(
                    elevation: 20,
                    absoluteZeroSpacing: false,
                    unSelectedColor: const Color.fromARGB(255, 0, 0, 0),
                    buttonLables: [
                      'Flat'.tr,
                      'Villa'.tr,
                      'Building'.tr,
                      'Clinic'.tr,
                      'Store'.tr,
                      'Farm'.tr,
                      'Factory'.tr,
                      'Land'.tr,
                      'Other'.tr,
                    ],
                    buttonValues: const [
                      "Flat",
                      "Villa",
                      "Building",
                      "Clinic",
                      "Store",
                      "Farm",
                      "Factory",
                      "Land",
                      "Other",
                    ],
                    buttonTextStyle: const ButtonTextStyle(
                        selectedColor: Colors.black,
                        unSelectedColor: Color.fromARGB(255, 205, 153, 51),
                        textStyle: TextStyle(fontSize: 16)),
                    radioButtonValue: (value) {
                      if (value == "Flat") {
                        setState(() {
                          visibleFloor = true;
                          visibleDoublex = true;
                          visibleNoRooms = true;
                          visibleNOBathrooms = true;
                          visibleFinishing = true;
                          visibleFurnished = true;
                          //
                          visibleNOFloors = false;
                          visibleTypeOFAcitivity = false;
                          visibleNoAB = false;
                          visibleNOFlats = false;
                        });
                      } else if (value == "Villa") {
                        setState(() {
                          visibleNoRooms = true;
                          visibleNOBathrooms = true;
                          visibleFinishing = true;
                          visibleFurnished = true;
                          visibleNOFloors = true;
                          //
                          visibleTypeOFAcitivity = false;
                          visibleNoAB = false;
                          visibleNOFlats = false;
                          visibleDoublex = false;
                          visibleFloor = false;
                        });
                      } else if (value == "Building") {
                        setState(() {
                          visibleNOFloors = true;
                          visibleNOFlats = true;
                          //
                          visibleFloor = false;
                          visibleDoublex = false;
                          visibleNoRooms = false;
                          visibleNOBathrooms = false;
                          visibleFinishing = false;
                          visibleFurnished = false;
                          visibleTypeOFAcitivity = false;
                          visibleNoAB = false;
                        });
                      } else if (value == "Clinic" ||
                          value == "Store" ||
                          value == "Land" ||
                          value == "Farm" ||
                          value == "Other") {
                        setState(() {
                          visibleTypeOFAcitivity = true;
                          //
                          visibleNOFloors = false;
                          visibleNOFlats = false;
                          visibleFloor = false;
                          visibleDoublex = false;
                          visibleNoRooms = false;
                          visibleNOBathrooms = false;
                          visibleFinishing = false;
                          visibleFurnished = false;
                          visibleNoAB = false;
                        });
                      } else if (value == "Farm") {
                        setState(() {
                          visibleTypeOFAcitivity = true;
                          visibleNoAB = true;
                          //
                          visibleNOFloors = false;
                          visibleNOFlats = false;
                          visibleFloor = false;
                          visibleDoublex = false;
                          visibleNoRooms = false;
                          visibleNOBathrooms = false;
                          visibleFinishing = false;
                          visibleFurnished = false;
                        });
                      }

                      userChoice = value;
                    },
                    selectedColor: const Color.fromARGB(255, 205, 153, 51),
                    selectedBorderColor: const Color.fromARGB(255, 0, 0, 0),
                    unSelectedBorderColor:
                        const Color.fromARGB(255, 205, 153, 51),
                  ),
                  //Owner Name
                  //Common

                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
                      controller: _ownerNameController,
                      obscureText: false,
                      labelText: "Owner Name",
                      hintText: "Owner Name",
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
                  //Owner Number
                  //Common
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
                  //Address User
                  //Common
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
                  //Address Admin
                  //Common
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
                  //Area
                  //Common
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
                  //Price
                  //Common
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
                  //Description User
                  //Common
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
                  //Description Admin
                  //Common
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
                  //Title
                  //Common
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

                  //Payment Method
                  //Common
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomDropdownButton2(
                      dropdownItems: const ["Cash", "installment"],
                      hint: "Select Payment Method",
                      value: paymentMethod,
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = value;
                          print(paymentMethod);
                        });
                      },
                      validatior: (value) {
                        if (value == null) {
                          return 'Please Select';
                        }
                        return null;
                      },
                      // validator: (value) {
                      //   if (value == null) {
                      //     return 'Please Select';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  //priority
                  //Common
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomDropdownButton2(
                      dropdownItems: const ["High", "medium", "Low"],
                      hint: "Select priority",
                      value: priority,
                      onChanged: (value) {
                        setState(() {
                          priority = value;
                        });
                      },
                      validatior: (value) {
                        if (value == null) {
                          return 'Please Select';
                        }
                        return null;
                      },
                      // validator: (value) {
                      //   if (value == null) {
                      //     return 'Please Select';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  //visible
                  //Common
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomDropdownButton2(
                      dropdownItems: const ["Yes", "No"],
                      hint: "Select visibility",
                      value: visible,
                      onChanged: (value) {
                        setState(() {
                          visible = value;
                        });
                      },
                      validatior: (value) {
                        if (value == null) {
                          return 'Please Select';
                        }
                        return null;
                      },
                    ),
                  ),
                  //offered
                  //Common
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomDropdownButton2(
                      dropdownItems: const ["For Sale", "For Rent"],
                      hint: "Select offering",
                      value: offered,
                      onChanged: (value) {
                        setState(() {
                          offered = value;
                        });
                      },
                      validatior: (value) {
                        if (value == null) {
                          return 'Please Select';
                        }
                        return null;
                      },
                    ),
                  ),
                  //Finishing
                  //Uncommon
                  Visibility(
                    visible: visibleFinishing,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 15, right: 15, bottom: 10),
                      child: CustomDropdownButton2(
                        dropdownItems: const ["Yes", "Half", "No"],
                        hint: "Select Finishing",
                        value: finishing,
                        onChanged: (value) {
                          setState(() {
                            finishing = value;
                          });
                        },
                        validatior: (value) {
                          if (value == null) {
                            return 'Please Select';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  //Doublex
                  //Uncommon
                  Visibility(
                    visible: visibleDoublex,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 15, right: 15, bottom: 10),
                      child: CustomDropdownButton2(
                        dropdownItems: const ["Yes", "No"],
                        hint: "Select yes if Doublex",
                        value: doublex,
                        onChanged: (value) {
                          setState(() {
                            doublex = value;
                          });
                        },
                        validatior: (value) {
                          if (value == null) {
                            return 'Please Select';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  //Furnished
                  //Uncommon
                  Visibility(
                    visible: visibleFurnished,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 15, right: 15, bottom: 10),
                      child: CustomDropdownButton2(
                        dropdownItems: const ["Yes", "No"],
                        hint: "Select yes if Furnished",
                        value: furnished,
                        onChanged: (value) {
                          setState(() {
                            furnished = value;
                          });
                        },
                        validatior: (value) {
                          if (value == null) {
                            return 'Please Select';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  //Floor
                  //Uncommon
                  Visibility(
                    visible: visibleFloor,
                    child: Padding(
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
                  ),
                  //Number Of Rooms
                  //Uncommon
                  Visibility(
                    visible: visibleNoRooms,
                    child: Padding(
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
                          if (visibleNoRooms == true) {
                            if (!value!.isValidNumber) {
                              return 'Please enter a valid Number';
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  //Number Of Bathrooms
                  //Uncommon
                  Visibility(
                    visible: visibleNOBathrooms,
                    child: Padding(
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
                          if (visibleNOBathrooms) {
                            if (!value!.isValidNumber) {
                              return 'Please enter a valid Number';
                            }
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                  //Number Of Floors
                  //Uncommon
                  Visibility(
                    visible: visibleNOFloors,
                    child: Padding(
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
                          if (visibleNOFloors) {
                            if (!value!.isValidNumber) {
                              return 'Please enter a valid Number';
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  //Number Of AB
                  //Uncommon
                  Visibility(
                    visible: visibleNoAB,
                    child: Padding(
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
                          if (visibleNoAB) {
                            if (!value!.isValidNumber) {
                              return 'Please enter a valid Number';
                            }
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                  //Number Of Flats
                  //Uncommon
                  Visibility(
                    visible: visibleNOFlats,
                    child: Padding(
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
                          if (visibleNOFlats) {
                            if (!value!.isValidNumber) {
                              return 'Please enter a valid Number';
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: visibleTypeOFAcitivity,
                    child: Padding(
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
                          if (visibleTypeOFAcitivity) {
                            if (!value!.isValidAddress) {
                              return 'Please enter a valid Type of Activity';
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Upload main image",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      openBottomSheet();
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8)),
                        child: myImage == null
                            ? const Center(
                                child: Icon(
                                  Icons.upload_file,
                                  size: 50,
                                ),
                              )
                            : Center(
                                child: Image.file(
                                myImage!,
                                fit: BoxFit.cover,
                              ))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Upload MuLtiple Sup-Images",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                          ),
                          Text(
                            "(Limit 20 Images Only!)",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      getMultipImage();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8)),
                      child: images.length == 0
                          ? const Center(
                              child: Icon(
                                Icons.drive_folder_upload,
                                size: 50,
                              ),
                            )
                          : GridView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: images.length,
                              itemBuilder: (_, index) {
                                return Image.file(
                                  images[index],
                                  fit: BoxFit.cover,
                                );
                              }),
                      // child: const Center(
                      //   child: Icon(
                      //     Icons.drive_folder_upload,
                      //     size: 50,
                      //   ),
                      // )
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                          if (userChoice != "") {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return const Center(
                                        child: CircularProgressIndicator(
                                      backgroundColor: Colors.black26,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 205, 153, 51)),
                                    ));
                                  });
                              //UploadSingleImage
                              listAddTOFirebase.add(_ownerNameController.text);
                              listAddTOFirebase
                                  .add(_ownerNumberController.text);
                              listAddTOFirebase
                                  .add(_addressForUserController.text);
                              listAddTOFirebase
                                  .add(_addressForAdminController.text);
                              listAddTOFirebase
                                  .add(int.parse(_areaController.text));
                              listAddTOFirebase
                                  .add(int.parse(_priceController.text));
                              listAddTOFirebase
                                  .add(_descriptionForUserController.text);
                              listAddTOFirebase
                                  .add(_descriptionForAdminController.text);
                              listAddTOFirebase.add(_nameController.text);
                              listAddTOFirebase.add(paymentMethod!);
                              listAddTOFirebase.add(priority!);
                              listAddTOFirebase.add(visible!);
                              listAddTOFirebase.add(offered!);
                              uploadFile().then((value) {
                                uploadMutilbeImages().then((value) {
                                  if (userChoice == "Flat") {
                                    PropertyManagement.getFlatData(
                                        commonUnitPrpoerties: listAddTOFirebase,
                                        floor: _floorController.text,
                                        doublex: doublex!,
                                        noRooms: _noOFRoomsController.text,
                                        noBathrooms:
                                            _noOFBathroomsController.text,
                                        finishing: finishing!,
                                        furnished: furnished!,
                                        singleImage: singleImageURl,
                                        mutliImages: downloadUrls);
                                    // .then((value) => {
                                    //       Navigator.of(context)
                                    //           .pushReplacementNamed('/home')
                                    //       // Navigator.of(context).pop(),
                                    //       // Navigator.of(context).pop()
                                    //     });
                                  } else if (userChoice == "Villa") {
                                    PropertyManagement.getVillaData(
                                        commonUnitPrpoerties: listAddTOFirebase,
                                        noFloors: _noOFFloorsController.text,
                                        noRooms: _noOFRoomsController.text,
                                        noBathrooms:
                                            _noOFBathroomsController.text,
                                        finishing: finishing!,
                                        furnished: furnished!,
                                        singleImage: singleImageURl,
                                        mutliImages: downloadUrls);
                                    // .then((value) => {
                                    //       Navigator.of(context)
                                    //           .pushReplacementNamed('/home')
                                    //       // Navigator.of(context).pop(),
                                    //       // Navigator.of(context).pop()
                                    //     });
                                  } else if (userChoice == "Building") {
                                    PropertyManagement.getBuildingData(
                                        commonUnitPrpoerties: listAddTOFirebase,
                                        noFlats: _noOFFlatsController.text,
                                        noFloors: _noOFFloorsController.text,
                                        singleImage: singleImageURl,
                                        mutliImages: downloadUrls);
                                    // .then((value) => {
                                    //       Navigator.of(context)
                                    //           .pushReplacementNamed('/home')
                                    //       // Navigator.of(context).pop(),
                                    //       // Navigator.of(context).pop()
                                    //     });
                                  } else if (userChoice == "Clinic" ||
                                      userChoice == "Store" ||
                                      userChoice == "Land" ||
                                      userChoice == "Factory" ||
                                      userChoice == "Other") {
                                    PropertyManagement
                                        .getClinicXStoreXLandXFactoryXOtherData(
                                            commonUnitPrpoerties:
                                                listAddTOFirebase,
                                            type: userChoice,
                                            typeOFActivity:
                                                _typeOFActivityController.text,
                                            singleImage: singleImageURl,
                                            mutliImages: downloadUrls);
                                    // .then((value) => {
                                    //       Navigator.of(context)
                                    //           .pushReplacementNamed('/home')
                                    //       // Navigator.of(context).pop(),
                                    //       // Navigator.of(context).pop()
                                    //     });
                                  } else if (userChoice == "Farm") {
                                    PropertyManagement.getFarmData(
                                        commonUnitPrpoerties: listAddTOFirebase,
                                        typeOFActivity:
                                            _typeOFActivityController.text,
                                        noAB: _noOFABController.text,
                                        singleImage: singleImageURl,
                                        mutliImages: downloadUrls);
                                    // .then((value) => {
                                    //       Navigator.of(context)
                                    //           .pushReplacementNamed('/home')
                                    //       // Navigator.of(context).pop(),
                                    //       // Navigator.of(context).pop()
                                    //     });
                                  }
                                });
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/home', (route) => false);
                              });
                            }
                          } else {
                            errormessage("Error!", "Please Choose a type!");
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(val.snackBar);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: Colors.red.withOpacity(0),
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
              ),
            ),
          ),
        ),
      ),
    );
  }

//Single Image
  openBottomSheet() {
    Get.bottomSheet(Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      width: double.infinity,
      height: 150,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        buildImageWidget(
            iconData: Icons.camera_alt,
            onPressed: () {
              getImage(ImageSource.camera);
            }),
        buildImageWidget(
            iconData: Icons.image,
            onPressed: () {
              getImage(ImageSource.gallery);
            }),
      ]),
    ));
  }

  buildImageWidget({required IconData iconData, required Function onPressed}) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            iconData,
            size: 30,
          ),
        ),
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();
  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      myImage = File(image.path);
      setState(() {});
      Get.back();
    }
  }

  Future uploadFile() async {
    final file = myImage!;
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);

    uploadTask.snapshotEvents.listen((event) {
      switch (event.state) {
        case TaskState.running:
          print("File is uploading");
          break;
        case TaskState.success:
          ref.getDownloadURL().then((value) {
            singleImageURl = value;
          });
          break;
        case TaskState.paused:
          // TODO: Handle this case.
          break;
        case TaskState.canceled:
          // TODO: Handle this case.
          break;
        case TaskState.error:
          // TODO: Handle this case.
          break;
      }
    });
  }

//Mutiple Images
  List<String> downloadUrls = [];
  final ImagePicker _pickerMutli = ImagePicker();
  getMultipImage() async {
    final List<XFile>? pickedImages = await _pickerMutli.pickMultiImage();
    images = [];
    int counter = 0;
    if (pickedImages != null) {
      // for (int i = 0; i < 20; i++) {
      //   images.add(File(pickedImages[i].path));
      // }
      pickedImages.forEach((e) {
        if (counter++ < 20) {
          images.add(File(e.path));
        }
      });

      setState(() {});
    }
  }

  Future uploadMutilbeImages() async {
    for (int i = 0; i < images.length; i++) {
      String url = await uploadMutibleFiles(images[i]);
      downloadUrls.add(url);
    }
  }

  Future<String> uploadMutibleFiles(File file) async {
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }
}
