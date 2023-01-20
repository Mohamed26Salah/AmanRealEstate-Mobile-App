import 'package:aman_project/data/form_management.dart';
import 'package:aman_project/data/image_management.dart';
import 'package:aman_project/data/property_managemnt.dart';
import 'package:aman_project/data/repositories/image_provider.dart';
import 'package:aman_project/models/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../shared_features/custom_loading_screen.dart';
import '../shared_features/custom_message.dart';
import '../../constants/globals.dart' as val;

//Removed Final
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AddForm extends ConsumerStatefulWidget {
  const AddForm({Key? key}) : super(key: key);

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
                        mainAxisSize: MainAxisSize.max,
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
                              imageManagement.clearImageProivders(ref);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Text(
                        "Add".tr,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Select Type".tr,
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
                                  buildOption("Flat".tr, flatButton1, 1),
                                  buildOption("Villa".tr, villaButton2, 2),
                                  buildOption(
                                      "Building".tr, buildingButton3, 3),
                                  buildOption("Store".tr, storeButton4, 4),
                                  buildOption("Clinic".tr, clinicButton5, 5),
                                  buildOption("Farm".tr, farmButton6, 6),
                                  buildOption("Factory".tr, factoryButton7, 7),
                                  buildOption("Land".tr, landButton8, 8),
                                  buildOption("Other".tr, otherButton9, 9),
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
                  FormManagement.buildTextField(
                      labelText: "Owner Name".tr,
                      hintText: "Owner Name".tr,
                      controller: _ownerNameController,
                      type: "name",
                      show: true,
                      context: context),
                  FormManagement.buildTextField(
                      labelText: "Owner Number".tr,
                      hintText: "01144..",
                      controller: _ownerNumberController,
                      type: "phone",
                      show: true,
                      context: context),
                  FormManagement.buildTextField(
                      labelText: "Address For User".tr,
                      hintText: "Address User".tr,
                      controller: _addressForUserController,
                      type: "address",
                      show: true,
                      context: context),
                  FormManagement.buildTextField(
                      labelText: "Address For Admin".tr,
                      hintText: "Address Admin".tr,
                      controller: _addressForAdminController,
                      type: "address",
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
                      labelText: "Price".tr,
                      hintText: "Price".tr,
                      controller: _priceController,
                      type: "number",
                      show: true,
                      context: context),
                  FormManagement.buildTextField(
                      labelText: "Description For User".tr,
                      hintText: "Description User".tr,
                      controller: _descriptionForUserController,
                      type: "address",
                      show: true,
                      context: context),
                  FormManagement.buildTextField(
                      labelText: "Description For Admin".tr,
                      hintText: "Description Admin".tr,
                      controller: _descriptionForAdminController,
                      type: "address",
                      show: true,
                      context: context),
                  FormManagement.buildTextField(
                      labelText: "Unit Name".tr,
                      hintText: "Unit Name".tr,
                      controller: _nameController,
                      type: "name",
                      context: context),
                  FormManagement.showDropdown(
                    dropdownItems: ["Cash".tr, "installment".tr],
                    hint: "Select Payment Method".tr,
                    text: "Select Payment Method".tr,
                    show: true,
                    value: paymentMethod,
                    context: context,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value;
                      });
                    },
                  ),
                  FormManagement.showDropdown(
                    dropdownItems: ["High".tr, "medium".tr, "Low".tr],
                    hint: "Select priority".tr,
                    text: "Select priority".tr,
                    show: true,
                    value: priority,
                    context: context,
                    onChanged: (value) {
                      setState(() {
                        priority = value;
                      });
                    },
                  ),
                  FormManagement.showDropdown(
                    dropdownItems: ["Yes".tr, "No".tr],
                    hint: "Select visibility".tr,
                    text: "Select visibility".tr,
                    show: true,
                    value: visible,
                    context: context,
                    onChanged: (value) {
                      setState(() {
                        visible = value;
                      });
                    },
                  ),
                  FormManagement.showDropdown(
                    dropdownItems: ["For Sale".tr, "For Rent".tr],
                    hint: "Select offering".tr,
                    text: "Select offering".tr,
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
                    child: FormManagement.showDropdown(
                      dropdownItems: ["Yes".tr, "Half".tr, "No".tr],
                      hint: "Select Finishing".tr,
                      text: "Select Finishing".tr,
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
                    child: FormManagement.showDropdown(
                      dropdownItems: ["Yes".tr, "No".tr],
                      hint: "Select yes if Doublex".tr,
                      text: "Select yes if Doublex".tr,
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
                    child: FormManagement.showDropdown(
                      dropdownItems: ["Yes".tr, "No".tr],
                      hint: "Select yes if Furnished".tr,
                      text: "Select yes if Furnished".tr,
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
                    child: FormManagement.buildTextField(
                        labelText: "Floor".tr,
                        hintText: "Floor".tr,
                        controller: _floorController,
                        type: "number",
                        show: true,
                        context: context),
                  ),
                  Visibility(
                    visible: visibleNoRooms,
                    child: FormManagement.buildTextField(
                        labelText: "Rooms".tr,
                        hintText: "Rooms".tr,
                        controller: _noOFRoomsController,
                        type: "number",
                        show: true,
                        context: context),
                  ),
                  Visibility(
                    visible: visibleNOBathrooms,
                    child: FormManagement.buildTextField(
                        labelText: "Barthrooms".tr,
                        hintText: "Barthrooms".tr,
                        controller: _noOFBathroomsController,
                        type: "number",
                        show: true,
                        context: context),
                  ),
                  Visibility(
                    visible: visibleNOFloors,
                    child: FormManagement.buildTextField(
                        labelText: "Number Of Floors".tr,
                        hintText: "Number Of Floors".tr,
                        controller: _noOFFloorsController,
                        type: "number",
                        show: true,
                        context: context),
                  ),
                  Visibility(
                    visible: visibleNoAB,
                    child: FormManagement.buildTextField(
                        labelText: "Number Of administrative buildings".tr,
                        hintText: "Number Of administrative buildings".tr,
                        controller: _noOFABController,
                        type: "number",
                        show: true,
                        context: context),
                  ),
                  Visibility(
                    visible: visibleNOFlats,
                    child: FormManagement.buildTextField(
                        labelText: "Number Of Flats".tr,
                        hintText: "Number Of Flats".tr,
                        controller: _noOFFlatsController,
                        type: "number",
                        show: true,
                        context: context),
                  ),
                  Visibility(
                    visible: visibleTypeOFAcitivity,
                    child: FormManagement.buildTextField(
                        labelText: "Type OF Activity".tr,
                        hintText: "Type OF Activity".tr,
                        controller: _typeOFActivityController,
                        type: "address",
                        show: true,
                        context: context),
                  ),
                  Center(
                    child: Text(
                      "Upload main image".tr,
                      style: const TextStyle(fontSize: 20),
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
                            border: Border.all(
                                color: Theme.of(context).backgroundColor),
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
                      children: [
                        Text(
                          "Upload Multiple Sub-Images".tr,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          "(Limit 20 Images Only!)".tr,
                          style: const TextStyle(fontSize: 10),
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
                          border: Border.all(
                              color: Theme.of(context).backgroundColor),
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
                            if (imageManagement.myImage != null ||
                                imageManagement.myImageMulti != null) {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                        child: LoadingScreen(),
                                      );
                                    });
                                await imageManagement
                                    .uploadFile()
                                    .then((value) async {
                                  await imageManagement
                                      .uploadMultipleImages()
                                      .then((value) async {
                                    await PropertyManagement().addPropertyData(
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
                                      unitName:
                                          _nameController.text.toLowerCase(),
                                      paymentMethod: paymentMethod!,
                                      priority: priority!,
                                      visible: visible!,
                                      offered: offered!,
                                      singleImage: imageManagement
                                              .singleImageURl ??
                                          'https://i.picsum.photos/id/825/200/300.jpg?hmac=02AaqBOvx8gwrGt7a3HWzJHnZXrMzYoXbAYwjJWH40E',
                                      mutliImages: imageManagement.downloadUrls,
                                      floor: _floorController.text,
                                      doublex: doublex ?? "",
                                      noRooms: _noOFRoomsController.text,
                                      noBathrooms:
                                          _noOFBathroomsController.text,
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
                                  if (!mounted) return;
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/home', (route) => false);
                                  goodMessageSnackBar("Uploading".tr,
                                      "Uploading to database".tr);
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(val.snackBar);
                                });
                              }
                            } else {
                              errormessage(
                                  "Error".tr, "Please upload images".tr);
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(val.snackBar);
                            }
                          } else {
                            errormessage(
                                "Error".tr, "Please Choose a type!".tr);
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
                color:
                    selected ? Colors.white : Theme.of(context).backgroundColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
