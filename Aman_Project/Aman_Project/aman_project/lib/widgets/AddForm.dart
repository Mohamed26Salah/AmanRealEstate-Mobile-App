import 'package:aman_project/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'CustomTextField.dart';
import 'dropdown.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'change_lang.dart';
import '../data/CustomTextField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

final _formKey = GlobalKey<FormState>();

class AddForm extends StatefulWidget {
  AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => AddFormState();
}

class AddFormState extends State<AddForm> {
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
                  const Text(
                    "Select The type",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
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
                        unSelectedColor:
                            const Color.fromARGB(255, 205, 153, 51),
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

                      print(value);
                    },
                    selectedColor: Color.fromARGB(255, 205, 153, 51),
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
                      hintText: "Owner Number",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
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
                        if (!value!.isValidName) {
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
                        if (!value!.isValidName) {
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
                        if (!value!.isValidName) {
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
                      dropdownItems: ["Cash", "installment"],
                      hint: "Select Payment Method",
                      value: paymentMethod,
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = value;
                          print(paymentMethod);
                        });
                      },
                    ),
                  ),
                  //priority
                  //Common
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomDropdownButton2(
                      dropdownItems: ["High", "medium", "Low"],
                      hint: "Select priority",
                      value: priority,
                      onChanged: (value) {
                        setState(() {
                          priority = value;
                        });
                      },
                    ),
                  ),
                  //visible
                  //Common
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomDropdownButton2(
                      dropdownItems: ["Yes", "No"],
                      hint: "Select visibility",
                      value: visible,
                      onChanged: (value) {
                        setState(() {
                          visible = value;
                        });
                      },
                    ),
                  ),
                  //offered
                  //Common
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomDropdownButton2(
                      dropdownItems: ["Yes", "No"],
                      hint: "Select offering",
                      value: offered,
                      onChanged: (value) {
                        setState(() {
                          offered = value;
                        });
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
                        dropdownItems: ["Yes", "Half", "No"],
                        hint: "Select Finishing",
                        value: finishing,
                        onChanged: (value) {
                          setState(() {
                            finishing = value;
                          });
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
                        dropdownItems: ["Yes", "No"],
                        hint: "Select yes if Doublex",
                        value: doublex,
                        onChanged: (value) {
                          setState(() {
                            doublex = value;
                          });
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
                        dropdownItems: ["Yes", "No"],
                        hint: "Select yes if Furnished",
                        value: furnished,
                        onChanged: (value) {
                          setState(() {
                            furnished = value;
                          });
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
                          if (!value!.isValidNumber) {
                            return 'Please enter a valid Number';
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
                          if (!value!.isValidNumber) {
                            return 'Please enter a valid Number';
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
                          if (!value!.isValidNumber) {
                            return 'Please enter a valid Number';
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
                          if (!value!.isValidNumber) {
                            return 'Please enter a valid Number';
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
                          if (!value!.isValidNumber) {
                            return 'Please enter a valid Number';
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
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      openBottomSheet();
                    },
                    child: Container(
                        width: 200,
                        height: 200,
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
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => Search()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          primary: Colors.red.withOpacity(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
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

  openBottomSheet() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
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
}
