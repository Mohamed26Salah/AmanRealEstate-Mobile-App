import 'package:aman_project/data/image_management.dart';
import 'package:aman_project/data/property_managemnt.dart';
import 'package:aman_project/data/repositories/image_provider.dart';
import 'package:aman_project/models/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../shared_features/custom_message.dart';
import '../../constants/globals.dart' as val;
import 'package:loading_animation_widget/loading_animation_widget.dart';

//Removed Final
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AddForm extends ConsumerStatefulWidget {
  AddForm({Key? key}) : super(key: key);

  @override
  ConsumerState<AddForm> createState() => AddFormState();
}

class AddFormState extends ConsumerState<AddForm> {
  String userChoice = "";
  var flatButton1 = false;
  var villaButton2 = false;
  var buildingButton3 = false;
  var storeButton4 = false;
  var clinicButton5 = false;
  var farmButton6 = false;
  var factoryButton7 = false;
  var landButton8 = false;
  var otherButton9 = false;
  // ChoiceButtons
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
  ImageManagement imageManagement = ImageManagement();
  void updateButtonsUIType(id) {
    _floorController.text = ''; //
    _noOFRoomsController.text = ''; //
    _noOFBathroomsController.text = ''; //
    _noOFFloorsController.text = ''; //
    _noOFABController.text = ''; //
    _noOFFlatsController.text = ''; //
    _typeOFActivityController.text = ''; //7

    doublex = null;
    finishing = null;
    furnished = null;
    flatButton1 = false;
    villaButton2 = false;
    buildingButton3 = false;
    storeButton4 = false;
    clinicButton5 = false;
    farmButton6 = false;
    factoryButton7 = false;
    landButton8 = false;
    otherButton9 = false;
    //
    visibleFloor = false;
    visibleDoublex = false;
    visibleNoRooms = false;
    visibleNOBathrooms = false;
    visibleFinishing = false;
    visibleFurnished = false;
    visibleNOFloors = false;
    visibleTypeOFAcitivity = false;
    visibleNoAB = false;
    visibleNOFlats = false;
    if (id == 1) {
      userChoice = "Flat";
      setState(() {
        flatButton1 = true;
        visibleFloor = true;
        visibleDoublex = true;
        visibleNoRooms = true;
        visibleNOBathrooms = true;
        visibleFinishing = true;
        visibleFurnished = true;
      });
    } else if (id == 2) {
      userChoice = "Villa";
      setState(() {
        villaButton2 = true;
        visibleNoRooms = true;
        visibleNOBathrooms = true;
        visibleFinishing = true;
        visibleFurnished = true;
        visibleNOFloors = true;
      });
    } else if (id == 3) {
      userChoice = "Building";
      setState(() {
        buildingButton3 = true;
        visibleNOFloors = true;
        visibleNOFlats = true;
      });
    } else if (id == 4 || id == 5 || id == 7 || id == 8 || id == 9) {
      if (id == 4) {
        storeButton4 = true;
        userChoice = "Store";
      } else if (id == 5) {
        clinicButton5 = true;
        userChoice = "Clinic";
      } else if (id == 7) {
        factoryButton7 = true;
        userChoice = "Factory";
      } else if (id == 8) {
        landButton8 = true;
        userChoice = "Land";
      } else if (id == 9) {
        otherButton9 = true;
        userChoice = "Other";
      }
      setState(() {
        visibleTypeOFAcitivity = true;
        //
      });
    } else if (id == 6) {
      userChoice = "Farm";
      setState(() {
        farmButton6 = true;
        visibleTypeOFAcitivity = true;
        visibleNoAB = true;
      });
    }
  }

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
                          imageManagement.clearImageProivders(ref);
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Select The type",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          child: Stack(
                            children: [
                              ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  buildOption("Flat", flatButton1, 1),
                                  buildOption("Villa", villaButton2, 2),
                                  buildOption("Building", buildingButton3, 3),
                                  buildOption("Store", storeButton4, 4),
                                  buildOption("Clinic", clinicButton5, 5),
                                  buildOption("Farm", farmButton6, 6),
                                  buildOption("Factory", factoryButton7, 7),
                                  buildOption("Land", landButton8, 8),
                                  buildOption("Other", otherButton9, 9),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 28,
                                  decoration: const BoxDecoration(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Property.buildTextField(
                      labelText: "Owner Name",
                      hintText: "Owner Name",
                      controller: _ownerNameController,
                      type: "name",
                      show: true),
                  Property.buildTextField(
                      labelText: "Owner Number",
                      hintText: "01144..",
                      controller: _ownerNumberController,
                      type: "phone",
                      show: true),
                  Property.buildTextField(
                      labelText: "Address For User",
                      hintText: "Address User",
                      controller: _addressForUserController,
                      type: "address",
                      show: true),
                  Property.buildTextField(
                      labelText: "Address For Admin",
                      hintText: "Address Admin",
                      controller: _addressForAdminController,
                      type: "address",
                      show: true),
                  Property.buildTextField(
                      labelText: "Area",
                      hintText: "Area",
                      controller: _areaController,
                      type: "number",
                      show: true),
                  Property.buildTextField(
                      labelText: "Price",
                      hintText: "Price",
                      controller: _priceController,
                      type: "number",
                      show: true),
                  Property.buildTextField(
                      labelText: "Description For User",
                      hintText: "Description User",
                      controller: _descriptionForUserController,
                      type: "address",
                      show: true),
                  Property.buildTextField(
                      labelText: "Description For Admin",
                      hintText: "Description Admin",
                      controller: _descriptionForAdminController,
                      type: "address",
                      show: true),
                  Property.buildTextField(
                      labelText: "Unit Name",
                      hintText: "Unit Name",
                      controller: _nameController,
                      type: "name"),
                  Property.showDropdown(
                    dropdownItems: ["Cash", "installment"],
                    hint: "Select Payment Method",
                    text: "Select Payment Method",
                    show: true,
                    value: paymentMethod,
                    context: context,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value;
                      });
                    },
                  ),
                  Property.showDropdown(
                    dropdownItems: ["High", "medium", "Low"],
                    hint: "Select priority",
                    text: "Select priority",
                    show: true,
                    value: priority,
                    context: context,
                    onChanged: (value) {
                      setState(() {
                        priority = value;
                      });
                    },
                  ),
                  Property.showDropdown(
                    dropdownItems: ["Yes", "No"],
                    hint: "Select visibility",
                    text: "Select visibility",
                    show: true,
                    value: visible,
                    context: context,
                    onChanged: (value) {
                      setState(() {
                        visible = value;
                      });
                    },
                  ),
                  Property.showDropdown(
                    dropdownItems: ["For Sale", "For Rent"],
                    hint: "Select offering",
                    text: "Select offering",
                    show: true,
                    value: offered,
                    context: context,
                    onChanged: (value) {
                      setState(() {
                        offered = value;
                      });
                    },
                  ),
                  Visibility(
                    visible: visibleFinishing,
                    child: Property.showDropdown(
                      dropdownItems: ["Yes", "Half", "No"],
                      hint: "Select Finishing",
                      text: "Select Finishing",
                      show: true,
                      value: finishing,
                      context: context,
                      onChanged: (value) {
                        setState(() {
                          finishing = value;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: visibleDoublex,
                    child: Property.showDropdown(
                      dropdownItems: ["Yes", "No"],
                      hint: "Select yes if Doublex",
                      text: "Select yes if Doublex",
                      show: true,
                      value: doublex,
                      context: context,
                      onChanged: (value) {
                        setState(() {
                          doublex = value;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: visibleFurnished,
                    child: Property.showDropdown(
                      dropdownItems: ["Yes", "No"],
                      hint: "Select yes if Furnished",
                      text: "Select yes if Furnished",
                      show: true,
                      value: furnished,
                      context: context,
                      onChanged: (value) {
                        setState(() {
                          furnished = value;
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: visibleFloor,
                    child: Property.buildTextField(
                        labelText: "Floor",
                        hintText: "Floor",
                        controller: _floorController,
                        type: "number",
                        show: true),
                  ),
                  Visibility(
                    visible: visibleNoRooms,
                    child: Property.buildTextField(
                        labelText: "Number Of Rooms",
                        hintText: "Number Of Rooms",
                        controller: _noOFRoomsController,
                        type: "number",
                        show: true),
                  ),
                  Visibility(
                    visible: visibleNOBathrooms,
                    child: Property.buildTextField(
                        labelText: "Number Of Bathrooms",
                        hintText: "Number Of Bathrooms",
                        controller: _noOFBathroomsController,
                        type: "number",
                        show: true),
                  ),
                  Visibility(
                    visible: visibleNOFloors,
                    child: Property.buildTextField(
                        labelText: "Number Of Floors",
                        hintText: "Number Of Floors",
                        controller: _noOFFloorsController,
                        type: "number",
                        show: true),
                  ),
                  Visibility(
                    visible: visibleNoAB,
                    child: Property.buildTextField(
                        labelText: "Number Of administrative buildings",
                        hintText: "Number Of administrative buildings",
                        controller: _noOFABController,
                        type: "number",
                        show: true),
                  ),
                  Visibility(
                    visible: visibleNOFlats,
                    child: Property.buildTextField(
                        labelText: "Number Of Flats",
                        hintText: "Number Of Flats",
                        controller: _noOFFlatsController,
                        type: "number",
                        show: true),
                  ),
                  Visibility(
                    visible: visibleTypeOFAcitivity,
                    child: Property.buildTextField(
                        labelText: "Type OF Activity",
                        hintText: "Type OF Activity",
                        controller: _typeOFActivityController,
                        type: "address",
                        show: true),
                  ),
                  const Center(
                    child: Text(
                      "Upload main image",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      ImageManagementWidget()
                          .openBottomSheet(ref, imageManagement);
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 180,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8)),
                        child: ref.watch(imageFileProivder) == null
                            ? const Center(
                                child: Icon(
                                  Icons.upload_file,
                                  size: 50,
                                ),
                              )
                            : Center(
                                child: Image.file(
                                ref.watch(imageFileProivder)!,
                                fit: BoxFit.cover,
                              ))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Upload Multiple Sub-Images",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          "(Limit 20 Images Only!)",
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      // getMultipImage();
                      await imageManagement.getMultipImage(ref);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8)),
                      child: (ref.watch(imagesListFileProivder).isEmpty)
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
                              itemCount:
                                  ref.watch(imagesListFileProivder).length,
                              itemBuilder: (_, index) {
                                return Image.file(
                                  ref.watch(imagesListFileProivder)[index]!,
                                  fit: BoxFit.cover,
                                );
                              }),
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
                                    return Center(
                                        child:
                                            LoadingAnimationWidget.dotsTriangle(
                                      color: const Color.fromARGB(
                                          255, 205, 153, 51),
                                      size: 80,
                                    ));
                                  });
                              imageManagement.uploadFile().then((value) async {
                                await imageManagement
                                    .uploadMultipleImages()
                                    .then((value) {
                                  PropertyManagement().addPropertyData(
                                    type: userChoice,
                                    ownerName: _ownerNameController.text,
                                    ownerNumber: _ownerNumberController.text,
                                    addressForUser:
                                        _addressForUserController.text,
                                    addressForAdmin:
                                        _addressForAdminController.text,
                                    area: int.parse(_areaController.text),
                                    price: int.parse(_priceController.text),
                                    descriptionForUser:
                                        _descriptionForUserController.text,
                                    descriptionForAdmin:
                                        _descriptionForAdminController.text,
                                    unitName: _nameController.text,
                                    paymentMethod: paymentMethod!,
                                    priority: priority!,
                                    visible: visible!,
                                    offered: offered!,
                                    singleImage: imageManagement.singleImageURl,
                                    mutliImages: imageManagement.downloadUrls,
                                    floor: _floorController.text,
                                    doublex: doublex ?? "",
                                    noRooms: _noOFRoomsController.text,
                                    noBathrooms: _noOFBathroomsController.text,
                                    finishing: finishing ?? "",
                                    furnished: furnished ?? "",
                                    noFloors: _noOFFloorsController.text,
                                    noFlats: _noOFFlatsController.text,
                                    typeOFActivity:
                                        _typeOFActivityController.text,
                                    noAB: _noOFABController.text,
                                  );
                                  imageManagement.clearImageProivders(ref);
                                });

                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/home', (route) => false);
                                goodMessageSnackBar(
                                    "Uploading", "Uploading to database");
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(val.snackBar);
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOption(String text, bool selected, int id) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          updateButtonsUIType(id);
        },
        child: Container(
          height: 45,
          width: 65,
          decoration: BoxDecoration(
              color: selected
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(
                width: selected ? 0 : 1,
                color: Colors.grey,
              )),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
