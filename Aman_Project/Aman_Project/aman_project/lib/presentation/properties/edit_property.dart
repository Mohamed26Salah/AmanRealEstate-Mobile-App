import 'dart:async';
import 'dart:io';

import 'package:aman_project/presentation/properties/property_widget_card.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../shared_features/custom_message.dart';
import '../shared_features/custom_text_field.dart';
import 'dropdown.dart';
import 'package:aman_project/models/property_managemnt.dart';
import '../../constants/globals.dart' as val;

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
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Upload main image",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 180,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  child: myImage == null
                      ? Center(
                          child: Image.network(widget.routeArgs.singleImage),
                        )
                      : Center(
                          child: Image.file(
                            myImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                InkWell(
                    onTap: () {
                      openBottomSheet();
                    },
                    child: const Center(
                      child: Icon(
                        Icons.upload_file,
                        size: 50,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, left: 15, right: 15, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          uploadFile().then((value) {
                            PropertyManagement.updateProperty(
                                docId: widget.routeArgs.docId,
                                ownerName: _ownerNameController.text,
                                ownerNumber: _ownerNumberController.text,
                                addressForUser: _addressForUserController.text,
                                addressForAdmin:
                                    _addressForAdminController.text,
                                area: int.parse(_areaController.text),
                                price: int.parse(_priceController.text),
                                descriptionForUser:
                                    _descriptionForUserController.text,
                                descriptionForAdmin:
                                    _descriptionForAdminController.text,
                                unitName: _nameController.text,
                                paymentMethod: widget.routeArgs.paymentMethod,
                                priority: widget.routeArgs.priority,
                                visible: widget.routeArgs.visible,
                                offered: widget.routeArgs.offered,
                                singleImage: widget.routeArgs.singleImage,
                                mutliImages: widget.routeArgs.multiImages,
                                type: widget.routeArgs.type,
                                floor: _floorController.text,
                                noRooms: _noOFRoomsController.text,
                                noBathrooms: _noOFBathroomsController.text,
                                noFloors: _noOFFloorsController.text,
                                noAB: _noOFABController.text,
                                noFlats: _noOFFlatsController.text,
                                typeOFActivity: _typeOFActivityController.text);
                          });
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/home', (route) => false);
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

  Future uploadFile() async {
    if( myImage != null) {

    
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
            widget.routeArgs.singleImage = value;

            print("object ${widget.routeArgs.singleImage}");
            print("value $value");
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
