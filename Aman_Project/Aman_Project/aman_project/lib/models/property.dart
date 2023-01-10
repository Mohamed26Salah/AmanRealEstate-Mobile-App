import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../presentation/shared_features/custom_decoration.dart';

class Property {
  String? docId;
  String addressAdmin;
  String addressUser;
  int area;
  // String code;
  String descriptionAdmin;
  String descriptionUser;
  String unitName;
  String offered;
  String ownerName;
  String ownerNumber;
  String paymentMethod;
  String priority;
  String type;
  String visible;
  int price;
  List<dynamic> multiImages;
  String singleImage;
  //UnCommon
  String? doublex;
  String? finishing;
  String? floor;
  String? furnished;
  String? noBathrooms;
  String? noFlats;
  String? noFloors;
  String? noRooms;
  String? theNumberOFAB;
  String? typeOFActivity;
  Property(
      {this.docId,
      required this.addressAdmin,
      required this.addressUser,
      required this.area,
      required this.descriptionAdmin,
      required this.descriptionUser,
      required this.unitName,
      required this.offered,
      required this.ownerName,
      required this.ownerNumber,
      required this.paymentMethod,
      required this.priority,
      required this.type,
      required this.visible,
      required this.price,
      required this.multiImages,
      required this.singleImage,
      this.doublex,
      this.finishing,
      this.floor,
      this.furnished,
      this.noBathrooms,
      this.noFlats,
      this.noFloors,
      this.noRooms,
      this.theNumberOFAB,
      this.typeOFActivity});
  Property.alternate({
    this.docId = '-1',
    this.addressAdmin = '',
    this.addressUser = '',
    this.area = 0,
    this.descriptionAdmin = '',
    this.descriptionUser = '',
    this.unitName = '',
    this.offered = '',
    this.ownerName = '',
    this.ownerNumber = '',
    this.paymentMethod = '',
    this.priority = '',
    this.type = '',
    this.visible = '',
    this.price = 0,
    this.multiImages = const [],
    this.singleImage = '',
  });
  factory Property.fromJson(Map<String, dynamic> json, String id) => Property(
        docId: id,
        addressAdmin: json["addressForAdmin"],
        addressUser: json["addressForUser"],
        area: json["area"],
        descriptionAdmin: json["descriptionForAdmin"],
        descriptionUser: json["descriptionForUser"],
        unitName: json["unitName"],
        offered: json["offered"],
        ownerName: json["ownerName"],
        ownerNumber: json["ownerNumber"],
        paymentMethod: json["paymentMethod"],
        priority: json["priority"],
        type: json["type"],
        visible: json["visible"],
        price: json["price"],
        multiImages: json["multiImages"],
        singleImage: json["singleImage"],
        doublex: json["doublex"],
        finishing: json["finishing"],
        floor: json["floor"],
        furnished: json["furnished"],
        noBathrooms: json["noBathrooms"],
        noFlats: json["noFlats"],
        noFloors: json["noFloors"],
        noRooms: json["noRooms"],
        theNumberOFAB: json["noAB"],
        typeOFActivity: json["typeOFActivity"],
      );
  Map<String, dynamic> toJson() => {
        "addressForAdmin": addressAdmin,
        "addressForUser": addressUser,
        "area": area,
        "descriptionForAdmin": descriptionAdmin,
        "descriptionForUser": descriptionUser,
        "unitName": unitName,
        "offered": offered,
        "ownerName": ownerName,
        "ownerNumber": ownerNumber,
        "paymentMethod": paymentMethod,
        "priority": priority,
        "type": type,
        "visible": visible,
        "price": price,
        "multiImages": multiImages,
        "singleImage": singleImage,
        "doublex": doublex ?? "",
        "finishing": finishing ?? "",
        "floor": floor ?? "",
        "furnished": furnished ?? "",
        "noBathrooms": noBathrooms ?? "",
        "noFlats": noFlats ?? "",
        "noFloors": noFloors ?? "",
        "noRooms": noRooms ?? "",
        "noAB": theNumberOFAB ?? "",
        "typeOFActivity": typeOFActivity ?? ""
      };

  static Padding buildTextField(
      {required String labelText,
      required String hintText,
      required TextEditingController controller,
      required String type,
      bool? show}) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
      child: type == 'number' || type == 'phone'
          ? show == false
              ? const SizedBox()
              : TextFormField(
                  controller: controller,
                  obscureText: false,
                  decoration: CommonStyle.textFieldStyle(
                      labelText: labelText, hintText: hintText),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (type == 'number') {
                      if (!value!.isValidNumber) {
                        return 'Please enter a valid $labelText';
                      }
                      return null;
                    }
                    if (type == 'phone') {
                      if (!value!.isValidPhone) {
                        return 'Please enter a valid $labelText';
                      }
                      return null;
                    }
                    return null;
                  },
                )
          : show == false
              ? const SizedBox()
              : TextFormField(
                  controller: controller,
                  obscureText: false,
                  decoration: CommonStyle.textFieldStyle(
                      labelText: labelText, hintText: hintText),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      // RegExp(r"[a-zA-Z0-9]+|\s"),
                      RegExp(
                          r"^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z ]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z0-9-_ ]*$"),
                    )
                  ],
                  validator: (value) {
                    if (type == 'name') {
                      //I hcange from valid name to valid ADDRESS
                      if (!value!.isValidAddress) {
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

  static Widget showDropdown({
    required String text,
    required List<String> dropdownItems,
    required String hint,
    String? value,
    bool? show,
    required BuildContext context,
    Function(String?)? onChanged,
  }) {
    return show == false
        ? const SizedBox()
        : Padding(
            padding:
                const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text),
                DropdownButtonFormField(
                  //To avoid long text overflowing.

                  isExpanded: true,
                  hint: Text(
                    hint,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  value: value,
                  items: dropdownItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: onChanged,
                  //French accent
                  validator: (value) {
                    if (value == null) {
                      return 'Please Select';
                    }
                    return null;
                  },
                  dropdownColor: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 205, 153, 51),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 205, 153, 51), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ],
            ),
          );
  }
}
