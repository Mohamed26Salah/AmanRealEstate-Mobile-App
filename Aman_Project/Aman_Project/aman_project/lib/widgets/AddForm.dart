import 'package:aman_project/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CustomTextField.dart';
import 'dropdown.dart';

final _formKey = GlobalKey<FormState>();

class AddForm extends StatefulWidget {
  AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => AddFormState();
}

class AddFormState extends State<AddForm> {
  // Initial Selected Value
  String? paymentMethod;
  String? priority;
  String? visible;
  String? offered;
  String? type;
  String? finishing;
  String? doublex;
  String? furnished;

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
                  //Owner Name
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
                      obscureText: false,
                      labelText: "Title",
                      hintText: "Title",
                      validator: (value) {
                        if (!value!.isValidName) {
                          return 'Please enter a valid Title';
                        }
                        return null;
                      },
                    ),
                  ),
                  //Code
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
                      obscureText: false,
                      labelText: "Code",
                      hintText: "Code",
                      validator: (value) {
                        if (!value!.isValidCode) {
                          return 'Code Must Be in Capital Letters';
                        }
                        return null;
                      },
                    ),
                  ),
                  //Type
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomDropdownButton2(
                      dropdownItems: [
                        "Flats",
                        "Residential Building",
                        "Villa",
                        "Store",
                        "Clinic",
                        "Farm",
                        "Factory",
                        "Land",
                        "Other"
                      ],
                      hint: "Select State Type",
                      value: type,
                      onChanged: (value) {
                        setState(() {
                          type = value;
                        });
                      },
                    ),
                  ),
                  //Payment Method
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
                        });
                      },
                    ),
                  ),
                  //priority
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
                  Padding(
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
                  //Doublex
                  Padding(
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
                  //Furnished
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomDropdownButton2(
                      dropdownItems: ["Yes", "No"],
                      hint: "Select yes if Doublex",
                      value: furnished,
                      onChanged: (value) {
                        setState(() {
                          furnished = value;
                        });
                      },
                    ),
                  ),
//Floor
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  //Number Of Rooms
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  //Number Of Bathrooms
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  //Number Of Floors
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  //Number Of AB
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
                  //Number Of Flats
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 10),
                    child: CustomTextField(
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
}
