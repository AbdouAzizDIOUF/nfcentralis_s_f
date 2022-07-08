import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:nfcentralis/components/admin/admin_user_card.dart';
import 'package:nfcentralis/components/loading_spinner.dart';
import 'package:nfcentralis/components/rounded_input_field.dart';
import 'package:nfcentralis/components/search_widget.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/components/header.dart';
import 'package:nfcentralis/controllers/utilisateur_controller.dart';
import 'package:nfcentralis/models/utilisateur.dart';
import 'package:nfcentralis/models_test_debug_solo/role.dart';
import 'package:nfcentralis/models_test_debug_solo/user.dart';
import 'package:nfcentralis/repository/utilisateur_repository.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListUser extends StatefulWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  ListUserState createState() => ListUserState();
}

class ListUserState extends State<ListUser> {
  late List userListFiltered = [];
  late int userId = -1;
  String query = '';
  int loaded = 0;
  var userController = UtilisateurController(UtilisateurRepository());

  @override
  void initState() {
    super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      userId = pref.getInt("id") ?? -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            if (Responsive.isDesktop(context))
              const Header(title: "Liste des utilisateurs"),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Column(
                  children: [
                    SearchWidget(
                        text: query,
                        onChanged: filterList,
                        hintText: "Rechercher"),
                    FutureBuilder<List>(
                        future: userController.getUtilisateurOfCompany(userId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting &&
                              loaded == 0) {
                            return Column(
                              children: const [
                                SizedBox(height: defaultPadding),
                                Center(child: LoadingSpinner()),
                              ],
                            );
                          }
                          loaded += 1;
                          if (snapshot.hasError) {
                            return const Center(child: Text('error'));
                          }
                          userListFiltered = snapshot.data!;
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            separatorBuilder: (BuildContext context, i) =>
                                const SizedBox(height: defaultPadding),
                            itemCount: userListFiltered.length,
                            itemBuilder: (BuildContext context, index) {
                              final user = userListFiltered[index];

                              return buildUser(user);
                            },
                          );
                        }),
                  ],
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUser(Utilisateur user) => AdminUserCard(
      firstName: user.firstName!,
      lastName: user.lastName!,
      email: user.email!,
      userName: user.userName!,
      mobile: user.mobile!,
      role: user.role![0].name,
      // role: user.role.name,
      press: () {
        Navigator.pushNamed(context, '/detail-user', arguments: user.id);
      },
      pressDelete: () {
        dialogDelete(user);
      },
      pressEdit: () {
        dialogEdit(user);
      });

  void filterList(String query) {
    final list = userList.where((u) {
      final firstNameLower = u.firstName?.toLowerCase();
      final lastNameLower = u.lastName?.toLowerCase();
      // final roleLower = u.role.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return firstNameLower!.contains(searchLower) ||
          lastNameLower!.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      userListFiltered = list;
    });
  }

  Future<dynamic> dialogDelete(Utilisateur user) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              scrollable: true,
              backgroundColor: secondaryColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(21.0))),
              title:
                  Text('Supprimer ' + user.lastName! + " " + user.firstName!),
              titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 20),
              actionsOverflowButtonSpacing: 20,
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return primaryColorLight;
                        }
                        return primaryColorLight; // Use the component's default.
                      })),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        // <-- Icon
                        Icons.cancel,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Annuler',
                        style: TextStyle(color: Colors.black),
                      ), // <-- Text
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Navigator.pushReplacementNamed(context, '/dashboard');
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.redAccent;
                        }
                        return Colors.redAccent; // Use the component's default.
                      })),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        // <-- Icon
                        Icons.delete,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Supprimer',
                        style: TextStyle(color: Colors.black),
                      ), // <-- Text
                    ],
                  ),
                ),
              ],
              content: const Text("Êtes-vous sur ?"),
            );
          });
        });
  }

  Future<dynamic> dialogEdit(Utilisateur user) {
    final _formKeyModalEdit = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    String? email, firstname, lastname, number, username;
    List listRole = ['ROLE_ADMIN', 'ROLE_CHEF', "ROLE_CHEF_ADJOINT"];
    String? selectedValue;

    final displayFirstNameController = TextEditingController();
    displayFirstNameController.text = user.firstName!;
    final displayLastNameController = TextEditingController();
    displayLastNameController.text = user.lastName!;
    final displayEmailController = TextEditingController();
    displayEmailController.text = user.email!;
    final displayMobileController = TextEditingController();
    displayMobileController.text = user.mobile!;
    final displayUserNameController = TextEditingController();
    displayUserNameController.text = user.userName!;
    // final displayRoleController = TextEditingController();
    // displayRoleController.text = user.role.id.toString();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              scrollable: true,
              backgroundColor: secondaryColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(21.0))),
              title: Text('Modifier ' + user.lastName! + " " + user.firstName!),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      RoundedInputField(
                        hintext: "Nom",
                        type: TextInputType.name,
                        icon: Icons.person,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            return;
                          }
                        },
                        controller: displayLastNameController,
                        onSaved: (newValue) => lastname = newValue,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return requiredFieldError;
                          }
                          return null;
                        },
                      ),
                      RoundedInputField(
                        hintext: "Prénom",
                        controller: displayFirstNameController,
                        type: TextInputType.name,
                        icon: Icons.person,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            return;
                          }
                        },
                        onSaved: (newValue) => firstname = newValue,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return requiredFieldError;
                          }
                          return null;
                        },
                      ),
                      RoundedInputField(
                        hintext: "Nom d'utilisateur",
                        controller: displayUserNameController,
                        type: TextInputType.name,
                        icon: Icons.alternate_email,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            return;
                          }
                        },
                        onSaved: (newValue) => username = newValue,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return requiredFieldError;
                          }
                          return null;
                        },
                      ),
                      RoundedInputField(
                        hintext: "Email",
                        controller: displayEmailController,
                        type: TextInputType.emailAddress,
                        icon: Icons.email,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            return;
                          } else if (emailValidatorRegEx.hasMatch(value)) {
                            return;
                          }
                        },
                        onSaved: (newValue) => email = newValue,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return requiredFieldError;
                          } else if (!emailValidatorRegEx.hasMatch(value)) {
                            return invalidEmailError;
                          }
                          return null;
                        },
                      ),
                      RoundedInputField(
                        hintext: "Numéro",
                        controller: displayMobileController,
                        type: TextInputType.number,
                        icon: Icons.phone_android,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            return;
                          } else if (phoneNumberValidatorRegEx
                              .hasMatch(value)) {
                            return;
                          }
                        },
                        onSaved: (newValue) => number = newValue,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return requiredFieldError;
                          } else if (!phoneNumberValidatorRegEx
                              .hasMatch(value)) {
                            return invalidPhoneNumberError;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      DropdownButton2(
                        hint: Text(
                          'Choisir role',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: roleList
                            .map((item) => DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        // value: selectedValue ?? user.role.id.toString(),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        },
                        buttonHeight: 40,
                        buttonWidth: 200,
                        itemHeight: 40,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return primaryColorLight;
                        }
                        return primaryColorLight; // Use the component's default.
                      })),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        // <-- Icon
                        Icons.cancel,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Annuler',
                        style: TextStyle(color: Colors.black),
                      ), // <-- Text
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKeyModalEdit.currentState!.validate()) {
                      _formKeyModalEdit.currentState!.save();
                      // Navigator.pushReplacementNamed(context, '/dashboard');
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return primaryColor;
                        }
                        return primaryColor; // Use the component's default.
                      })),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        // <-- Icon
                        Icons.save,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Sauvegarder',
                        style: TextStyle(color: Colors.black),
                      ), // <-- Text
                    ],
                  ),
                ),
              ],
            );
          });
        });
  }
}
