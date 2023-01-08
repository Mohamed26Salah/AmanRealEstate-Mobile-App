import 'package:aman_project/data/image_management.dart';
import 'package:aman_project/data/repositories/image_provider.dart';
import 'package:aman_project/models/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../shared_features/custom_message.dart';
import 'package:aman_project/data/property_managemnt.dart';
import '../../constants/globals.dart' as val;
import 'package:loading_animation_widget/loading_animation_widget.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EditProperty extends ConsumerStatefulWidget {
  // Property routeArgs;
  EditProperty({
    super.key,
    // required this.routeArgs
  });

  @override
  ConsumerState<EditProperty> createState() => _EditPropertyState();
}

class _EditPropertyState extends ConsumerState<EditProperty> {
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

  // File? myImage;
  ImageManagement imageManagement = ImageManagement();
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

  // List<File> images = [];
  int? counter;
  @override
  void initState() {
    counter = 0;
    super.initState();
  }

  bool applychanges = false;
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
      _noOFBathroomsController.text = routeArgs.noBathrooms!;
      _noOFFloorsController.text = routeArgs.noFloors!;
      _noOFABController.text = routeArgs.theNumberOFAB!;
      _noOFFlatsController.text = routeArgs.noFlats!;
      _typeOFActivityController.text = routeArgs.typeOFActivity!;
      counter = counter! + 1;
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: applychanges
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: LoadingAnimationWidget.dotsTriangle(
                      color: const Color.fromARGB(255, 205, 153, 51),
                      size: 70,
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("applying changes")
                  ],
                ),
              )
            : Form(
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
                              "Edit",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Property.buildTextField(
                            labelText: "Owner Name",
                            hintText: "Owner Name",
                            controller: _ownerNameController,
                            type: "name",
                            show: _ownerNameController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Owner Number",
                            hintText: "01144..",
                            controller: _ownerNumberController,
                            type: "phone",
                            show: _ownerNumberController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Address For User",
                            hintText: "Address User",
                            controller: _addressForUserController,
                            type: "address",
                            show: _addressForUserController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Address For Admin",
                            hintText: "Address Admin",
                            controller: _addressForAdminController,
                            type: "address",
                            show: _addressForAdminController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Area",
                            hintText: "Area",
                            controller: _areaController,
                            type: "number",
                            show: _areaController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Price",
                            hintText: "Price",
                            controller: _priceController,
                            type: "number",
                            show: _priceController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Description For User",
                            hintText: "Description For User",
                            controller: _descriptionForUserController,
                            type: "address",
                            show:
                                _descriptionForUserController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Description For Admin",
                            hintText: "Description For Admin",
                            controller: _descriptionForAdminController,
                            type: "address",
                            show:
                                _descriptionForAdminController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Unit Name",
                            hintText: "Unit Name",
                            controller: _nameController,
                            type: "name",
                            show: _nameController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Floor",
                            hintText: "Floor",
                            controller: _floorController,
                            type: "number",
                            show: _floorController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Number Of Rooms",
                            hintText: "Number Of Rooms",
                            controller: _noOFRoomsController,
                            type: "number",
                            show: _noOFRoomsController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Number Of Bathrooms",
                            hintText: "Number Of Bathrooms",
                            controller: _noOFBathroomsController,
                            type: "number",
                            show: _noOFBathroomsController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Number Of Floors",
                            hintText: "Number Of Floors",
                            controller: _noOFFloorsController,
                            type: "number",
                            show: _noOFFloorsController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Number Of Flats",
                            hintText: "Number Of Flats",
                            controller: _noOFFlatsController,
                            type: "number",
                            show: _noOFFlatsController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Type OF Activity",
                            hintText: "Type OF Activity",
                            controller: _typeOFActivityController,
                            type: "address",
                            show: _typeOFActivityController.text.isNotEmpty),
                        Property.buildTextField(
                            labelText: "Number Of administrative buildings",
                            hintText: "Number Of administrative buildings",
                            controller: _noOFABController,
                            type: "number",
                            show: _noOFABController.text.isNotEmpty),
                        Property.showDropdown(
                            dropdownItems: ["High", "medium", "Low"],
                            hint: "Select priority",
                            text: "Select priority",
                            value: routeArgs.priority,
                            show: true,
                            context: context,
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
                            context: context,
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
                            context: context,
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
                            context: context,
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
                            context: context,
                            onChanged: (val) {
                              setState(() {
                                routeArgs.doublex = val;
                              });
                            }),
                        const Center(
                          child: Text(
                            "Edit main image",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                          child: ref.watch(imageFileProivder) == null
                              ? Center(
                                  child: Image.network(routeArgs.singleImage),
                                )
                              : Center(
                                  child: Image.file(
                                    ref.watch(imageFileProivder)!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        InkWell(
                            onTap: () {
                              // openBottomSheet();
                              ImageManagementWidget()
                                  .openBottomSheet(ref, imageManagement);
                            },
                            child: const Center(
                              child: Icon(
                                Icons.upload_file,
                                size: 50,
                              ),
                            )),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Edit Multiple Sub-Images",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Text(
                                "(Limit 20 Images Only!)",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10),
                              ),
                            ],
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
                          child: (ref.watch(imagesListFileProivder).isEmpty)
                              ? GridView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount: routeArgs.multiImages.length,
                                  itemBuilder: (_, index) {
                                    return Image.network(
                                      routeArgs.multiImages[index],
                                      fit: BoxFit.cover,
                                    );
                                  })
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
                        InkWell(
                            onTap: () {
                              imageManagement.getMultipImage(ref);
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
                                setState(() {
                                  applychanges = true;
                                });
                                if (_formKey.currentState!.validate()) {
                                  imageManagement
                                      .editUploadFile(routeArgs)
                                      .then((value) async {
                                    imageManagement
                                        .editUploadMutilbeImages(routeArgs)
                                        .then((value2) async {
                                      await PropertyManagement.updateProperty(
                                          docId: routeArgs.docId!,
                                          ownerName: routeArgs.ownerName =
                                              _ownerNameController.text,
                                          ownerNumber: routeArgs.ownerNumber =
                                              _ownerNumberController.text,
                                          addressForUser: routeArgs.addressUser =
                                              _addressForUserController.text,
                                          addressForAdmin: routeArgs.addressAdmin =
                                              _addressForAdminController.text,
                                          area: routeArgs.area =
                                              int.parse(_areaController.text),
                                          price: routeArgs.price =
                                              int.parse(_priceController.text),
                                          descriptionForUser:
                                              routeArgs.descriptionUser =
                                                  _descriptionForUserController
                                                      .text,
                                          descriptionForAdmin: routeArgs.descriptionAdmin =
                                              _descriptionForAdminController.text,
                                          unitName: routeArgs.unitName = _nameController.text,
                                          paymentMethod: routeArgs.paymentMethod = routeArgs.paymentMethod,
                                          priority: routeArgs.priority = routeArgs.priority,
                                          visible: routeArgs.visible = routeArgs.visible,
                                          offered: routeArgs.offered = routeArgs.offered,
                                          singleImage: routeArgs.singleImage = value,
                                          mutliImages: routeArgs.multiImages = value2,
                                          type: routeArgs.type = routeArgs.type,
                                          floor: routeArgs.floor = _floorController.text,
                                          noRooms: routeArgs.noRooms = _noOFRoomsController.text,
                                          noBathrooms: routeArgs.noBathrooms = _noOFBathroomsController.text,
                                          noFloors: routeArgs.noFloors = _noOFFloorsController.text,
                                          noAB: routeArgs.theNumberOFAB = _noOFABController.text,
                                          noFlats: routeArgs.noFlats = _noOFFlatsController.text,
                                          typeOFActivity: routeArgs.typeOFActivity = _typeOFActivityController.text);

                                      Navigator.pop(context, routeArgs);
                                    });
                                    // imageManagement.clearImageProivders(ref);
                                  });
                                } else {
                                  errormessage(
                                      "Error!", "Some Fields are Wrong!");
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
}
