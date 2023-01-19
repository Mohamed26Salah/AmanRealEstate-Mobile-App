import 'package:aman_project/data/form_management.dart';
import 'package:aman_project/data/image_management.dart';
import 'package:aman_project/data/repositories/image_provider.dart';
import 'package:aman_project/models/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../shared_features/custom_message.dart';
import 'package:aman_project/data/property_managemnt.dart';
import '../../constants/globals.dart' as val;
import '../shared_features/custom_loading_screen.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EditProperty extends ConsumerStatefulWidget {
  // Property routeArgs;
  const EditProperty({
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
  int counter = 0;
  @override
  void initState() {
    super.initState();
  }

  bool applychanges = false;
  final List test = [];
  @override
  Widget build(BuildContext context) {
    Property routeArgs = ModalRoute.of(context)!.settings.arguments as Property;

    if (counter++ == 0) {
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
    }

    return Scaffold(
      body: SafeArea(
        child: applychanges
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: LoadingScreen(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("applying changes")
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
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
                                  Navigator.pop(context, routeArgs);
                                },
                              ),
                            ],
                          ),
                          const Text(
                            "Edit",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          FormManagement.buildTextField(
                              labelText: "Owner Name",
                              hintText: "Owner Name",
                              controller: _ownerNameController,
                              type: "name",
                              show: routeArgs.ownerName.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Owner Number",
                              hintText: "01144..",
                              controller: _ownerNumberController,
                              type: "phone",
                              show: routeArgs.ownerNumber.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Address For User",
                              hintText: "Address User",
                              controller: _addressForUserController,
                              type: "address",
                              show: routeArgs.addressUser.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Address For Admin",
                              hintText: "Address Admin",
                              controller: _addressForAdminController,
                              type: "address",
                              show: routeArgs.addressAdmin.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Area",
                              hintText: "Area",
                              controller: _areaController,
                              type: "number",
                              show: routeArgs.area.toString().isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Price",
                              hintText: "Price",
                              controller: _priceController,
                              type: "number",
                              show: routeArgs.price.toString().isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Description For User",
                              hintText: "Description For User",
                              controller: _descriptionForUserController,
                              type: "address",
                              show: routeArgs.descriptionUser.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Description For Admin",
                              hintText: "Description For Admin",
                              controller: _descriptionForAdminController,
                              type: "address",
                              show: routeArgs.descriptionAdmin.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Unit Name",
                              hintText: "Unit Name",
                              controller: _nameController,
                              type: "name",
                              show: routeArgs.unitName.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Floor",
                              hintText: "Floor",
                              controller: _floorController,
                              type: "number",
                              show: routeArgs.floor!.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Number Of Rooms",
                              hintText: "Number Of Rooms",
                              controller: _noOFRoomsController,
                              type: "number",
                              show: routeArgs.noRooms!.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Number Of Bathrooms",
                              hintText: "Number Of Bathrooms",
                              controller: _noOFBathroomsController,
                              type: "number",
                              show: routeArgs.noBathrooms!.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Number Of Floors",
                              hintText: "Number Of Floors",
                              controller: _noOFFloorsController,
                              type: "number",
                              show: routeArgs.noFloors!.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Number Of Flats",
                              hintText: "Number Of Flats",
                              controller: _noOFFlatsController,
                              type: "number",
                              show: routeArgs.noFlats!.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Type OF Activity",
                              hintText: "Type OF Activity",
                              controller: _typeOFActivityController,
                              type: "address",
                              show: routeArgs.typeOFActivity!.isNotEmpty,
                              context: context),
                          FormManagement.buildTextField(
                              labelText: "Number Of administrative buildings",
                              hintText: "Number Of administrative buildings",
                              controller: _noOFABController,
                              type: "number",
                              show: routeArgs.theNumberOFAB!.isNotEmpty,
                              context: context),
                          FormManagement.showDropdown(
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
                          FormManagement.showDropdown(
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
                          FormManagement.showDropdown(
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
                          FormManagement.showDropdown(
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
                          FormManagement.showDropdown(
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
                              style: TextStyle(fontSize: 20),
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
                                border: Border.all(
                                    color: Theme.of(context).backgroundColor),
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
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "(Limit 20 Images Only!)",
                                  style: TextStyle(fontSize: 10),
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
                                border: Border.all(
                                    color: Theme.of(context).backgroundColor),
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
                                    itemCount: ref
                                        .watch(imagesListFileProivder)
                                        .length,
                                    itemBuilder: (_, index) {
                                      return Image.file(
                                        ref.watch(
                                            imagesListFileProivder)[index]!,
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
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      applychanges = true;
                                    });
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
                                            price: routeArgs.price = int.parse(
                                                _priceController.text),
                                            descriptionForUser: routeArgs
                                                    .descriptionUser =
                                                _descriptionForUserController.text,
                                            descriptionForAdmin: routeArgs.descriptionAdmin = _descriptionForAdminController.text,
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
      ),
    );
  }
}
