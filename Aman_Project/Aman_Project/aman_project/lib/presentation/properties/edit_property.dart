import 'dart:async';
import 'dart:io';

import 'package:aman_project/models/property.dart';
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
import 'package:aman_project/data/property_managemnt.dart';
import '../../constants/globals.dart' as val;

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EditProperty extends StatefulWidget {
  // Property routeArgs;
  EditProperty({
    super.key,
    // required this.routeArgs
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

  int? counter;
  @override
  void initState() {
    counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Property routeArgs = ModalRoute.of(context)!.settings.arguments as Property;

    if (counter == 0) {
      _ownerNameController.text = routeArgs.ownerName;
      _ownerNumberController.text = routeArgs.ownerNumber;
      _addressForUserController.text = routeArgs.addressUser;
      _addressForAdminController.text = routeArgs.addressAdmin;
      _areaController.text = routeArgs.area.toString();
      _priceController.text = routeArgs.price.toString();
      _descriptionForUserController.text = routeArgs.descriptionUser;
      _descriptionForAdminController.text = routeArgs.descriptionAdmin;
      _nameController.text = routeArgs.unitName;
      _floorController.text = routeArgs.floor!;
      _noOFRoomsController.text = routeArgs.noFloors!;
      _noOFBathroomsController.text = routeArgs.noBarthrooms!;
      _noOFFloorsController.text = routeArgs.noFloors!;
      _noOFABController.text = routeArgs.theNumberOFAB!;
      _noOFFlatsController.text = routeArgs.noFlats!;
      _typeOFActivityController.text = routeArgs.typeOFActivity!;
      counter = counter! + 1;
    }

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: Column(
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
                  Property.buildTextField(
                      labelText: "Owner Name",
                      hintText: "Owner Name",
                      controller: _ownerNameController,
                      type: "name"),
                  Property.buildTextField(
                      labelText: "Owner Number",
                      hintText: "01144..",
                      controller: _ownerNumberController,
                      type: "number"),
                  Property.buildTextField(
                      labelText: "Address For User",
                      hintText: "Address User",
                      controller: _addressForUserController,
                      type: "address"),
                  Property.buildTextField(
                      labelText: "Address For Admin",
                      hintText: "Address Admin",
                      controller: _addressForAdminController,
                      type: "address"),
                  Property.buildTextField(
                      labelText: "Area",
                      hintText: "Area",
                      controller: _areaController,
                      type: "number"),
                  Property.buildTextField(
                      labelText: "Price",
                      hintText: "Price",
                      controller: _priceController,
                      type: "number"),
                  Property.buildTextField(
                      labelText: "Description For User",
                      hintText: "Description For User",
                      controller: _descriptionForUserController,
                      type: "address"),
                  Property.buildTextField(
                      labelText: "Description For Admin",
                      hintText: "Description For Admin",
                      controller: _descriptionForAdminController,
                      type: "address"),
                  Property.buildTextField(
                      labelText: "Unit Name",
                      hintText: "Unit Name",
                      controller: _nameController,
                      type: "name"),
                  Property.buildTextField(
                      labelText: "Floor",
                      hintText: "Floor",
                      controller: _floorController,
                      type: "number"),
                  Property.buildTextField(
                      labelText: "Number Of Rooms",
                      hintText: "Number Of Rooms",
                      controller: _noOFRoomsController,
                      type: "number"),
                  Property.buildTextField(
                      labelText: "Number Of Bathrooms",
                      hintText: "Number Of Bathrooms",
                      controller: _noOFBathroomsController,
                      type: "number"),
                  Property.buildTextField(
                      labelText: "Number Of Floors",
                      hintText: "Number Of Floors",
                      controller: _noOFFloorsController,
                      type: "number"),
                  Property.buildTextField(
                      labelText: "Number Of Flats",
                      hintText: "Number Of Flats",
                      controller: _noOFFlatsController,
                      type: "number"),
                  Property.buildTextField(
                      labelText: "Type OF Activity",
                      hintText: "Type OF Activity",
                      controller: _typeOFActivityController,
                      type: "address"),
                  Property.buildTextField(
                      labelText: "Number Of administrative buildings",
                      hintText: "Number Of administrative buildings",
                      controller: _noOFABController,
                      type: "number"),
                  Property.showDropdown(
                      dropdownItems: ["High", "medium", "Low"],
                      hint: "Select priority",
                      text: "Select priority",
                      value: routeArgs.priority,
                      show: true,
                      onChanged: (val) {
                        setState(() {
                          routeArgs.priority = val!;
                        });
                      }),
                  Property.showDropdown(
                      dropdownItems: ["Yes", "No"],
                      hint: "Select visibility",
                      text: "Select visibility",
                      value: routeArgs.visible,
                      show: true,
                      onChanged: (val) {
                        setState(() {
                          routeArgs.visible = val!;
                        });
                      }),
                  Property.showDropdown(
                      dropdownItems: ["For Sale", "For Rent"],
                      hint: "Select offering",
                      text: "Select offering",
                      value: routeArgs.offered,
                      show: true,
                      onChanged: (val) {
                        setState(() {
                          routeArgs.offered = val!;
                        });
                      }),
                  Property.showDropdown(
                      dropdownItems: ["Yes", "Half", "No"],
                      hint: "Finishing",
                      text: "Select Finishing",
                      value: routeArgs.finishing,
                      show: routeArgs.finishing!.isNotEmpty,
                      onChanged: (val) {
                        setState(() {
                          routeArgs.finishing = val;
                        });
                      }),
                  Property.showDropdown(
                      dropdownItems: ["Yes", "No"],
                      hint: "Select yes if Doublex",
                      text: "Select yes if Doublex",
                      value: routeArgs.doublex,
                      show: routeArgs.doublex!.isNotEmpty,
                      onChanged: (val) {
                        setState(() {
                          routeArgs.doublex = val;
                        });
                      }),
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
                        "Edit main image",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
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
                            child: Image.network(routeArgs.singleImage),
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
                            uploadFile(routeArgs);

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

  Future uploadFile(Property routeArgs) async {
    String? result = '';
    if (myImage != null) {
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
              routeArgs.singleImage = value;

              print("object ${routeArgs.singleImage}");
              print("value $value");
              result = value;
              PropertyManagement.updateProperty(
                  docId: routeArgs.docId,
                  ownerName: _ownerNameController.text,
                  ownerNumber: _ownerNumberController.text,
                  addressForUser: _addressForUserController.text,
                  addressForAdmin: _addressForAdminController.text,
                  area: int.parse(_areaController.text),
                  price: int.parse(_priceController.text),
                  descriptionForUser: _descriptionForUserController.text,
                  descriptionForAdmin: _descriptionForAdminController.text,
                  unitName: _nameController.text,
                  paymentMethod: routeArgs.paymentMethod,
                  priority: routeArgs.priority,
                  visible: routeArgs.visible,
                  offered: routeArgs.offered,
                  singleImage: value,
                  mutliImages: routeArgs.multiImages,
                  type: routeArgs.type,
                  floor: _floorController.text,
                  noRooms: _noOFRoomsController.text,
                  noBathrooms: _noOFBathroomsController.text,
                  noFloors: _noOFFloorsController.text,
                  noAB: _noOFABController.text,
                  noFlats: _noOFFlatsController.text,
                  typeOFActivity: _typeOFActivityController.text,
                  doublex: routeArgs.doublex,
                  finishing: routeArgs.finishing,
                  furnished: routeArgs.furnished);
              return result;
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
    } else {
      print("in here");
      PropertyManagement.updateProperty(
          docId: routeArgs.docId,
          ownerName: _ownerNameController.text,
          ownerNumber: _ownerNumberController.text,
          addressForUser: _addressForUserController.text,
          addressForAdmin: _addressForAdminController.text,
          area: int.parse(_areaController.text),
          price: int.parse(_priceController.text),
          descriptionForUser: _descriptionForUserController.text,
          descriptionForAdmin: _descriptionForAdminController.text,
          unitName: _nameController.text,
          paymentMethod: routeArgs.paymentMethod,
          priority: routeArgs.priority,
          visible: routeArgs.visible,
          offered: routeArgs.offered,
          singleImage: routeArgs.singleImage,
          mutliImages: routeArgs.multiImages,
          type: routeArgs.type,
          floor: _floorController.text,
          noRooms: _noOFRoomsController.text,
          noBathrooms: _noOFBathroomsController.text,
          noFloors: _noOFFloorsController.text,
          noAB: _noOFABController.text,
          noFlats: _noOFFlatsController.text,
          typeOFActivity: _typeOFActivityController.text,
          doublex: routeArgs.doublex,
          finishing: routeArgs.finishing,
          furnished: routeArgs.furnished);
    }
  }
}
