import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/controller/profile_editing/profile_editing_cubit.dart';
import 'package:e_commerce/controller/profile_editing/profile_editing_state.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/view/constans/app_assets_images/app_assets_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../constans/flutter_toast/flutter_toast.dart';
import '../../constans/keys/keys.dart';
import '../../widgets/custom_textField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final TextEditingController _userNameController = TextEditingController();
final TextEditingController _userEmailController = TextEditingController();
final TextEditingController _descriptionUserController =
    TextEditingController();
final GlobalKey<FormState> _editProfileKey = GlobalKey<FormState>();
bool isLoading = false;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? userName, userEmail, description;

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileEditing, ProfileEditingState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileEditing profileEditingCubit = ProfileEditing.get(context);
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Form(
              key: _editProfileKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Stack(children: [
                        profileEditingCubit.iimage == null
                            ? const Padding(
                                padding: EdgeInsets.only(top: 80),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(AppAssets.myUserAcccount1),
                                  radius: 70,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 80),
                                child: CircleAvatar(
                                  backgroundImage: FileImage(
                                      File(profileEditingCubit.iimage!.path)),
                                  radius: 70,
                                ),
                              ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.lightBlue.shade100,
                            ),
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      actions: [
                                        ListTile(
                                          onTap: () {
                                            profileEditingCubit
                                                .pickImageFromCamera();
                                          },
                                          title: Text(
                                            S.of(context).camera,
                                            style: const TextStyle(
                                                fontFamily: "Rubik"),
                                          ),
                                          trailing: const Icon(
                                              Icons.camera_alt_rounded),
                                        ),
                                        ListTile(
                                          onTap: () {
                                            profileEditingCubit
                                                .pickImageFromGallary();
                                          },
                                          title: Text(
                                            S.of(context).gallary,
                                            style: const TextStyle(
                                                fontFamily: "Rubik"),
                                          ),
                                          trailing:
                                              const Icon(Icons.image_rounded),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.camera_alt_rounded,
                                  size: 18),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const ListTile(
                      contentPadding: EdgeInsets.only(left: 10, right: 25),
                      title: Center(
                        child: Text(
                          "Hossam Samin ",
                          style: TextStyle(fontFamily: "Rubik"),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          "hossamsamin505@gmail.com",
                          style: TextStyle(fontFamily: "Rubik", fontSize: 9),
                        ),
                      ),
                    ),
                    Text(
                      S.of(context).des_profile,
                      style: const TextStyle(fontFamily: "Rubik"),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber.shade100,
                          ),
                          child: const Icon(
                            Icons.person_2_rounded,
                            color: Colors.brown,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Card(
                              margin: const EdgeInsets.only(right: 20),
                              color: Colors.grey.withOpacity(.3),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: CustomTextField(
                                controller: _userNameController,
                                onChange: (value) {},
                                hintText: S.of(context).username_profile,
                                onSaved: (value) {
                                  userName = value;
                                },
                                validation: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Please Enter Your User Name';
                                  } else if (value.length > 32) {
                                    return 'Name Must be less than 32 characters';
                                  }
                                },
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber.shade100,
                          ),
                          child: const Icon(
                            Icons.email_rounded,
                            color: Colors.brown,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Card(
                              margin: const EdgeInsets.only(right: 20),
                              color: Colors.grey.withOpacity(.3),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: CustomTextField(
                                controller: _userEmailController,
                                onChange: (value) {},
                                hintText: S.of(context).email_profile,
                                onSaved: (value) {
                                  userEmail = value;
                                },
                                validation: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Please Enter Your Email';
                                  } else if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                                      .hasMatch(value)) {
                                    return 'Required Ex -> example@gmail.com';
                                  }
                                },
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber.shade100,
                          ),
                          child: const Icon(
                            Icons.article_rounded,
                            color: Colors.brown,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Card(
                              margin: const EdgeInsets.only(right: 20),
                              color: Colors.grey.withOpacity(.3),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: CustomTextField(
                                controller: _descriptionUserController,
                                onChange: (value) {},
                                hintText: S.of(context).description_profile,
                                onSaved: (value) {
                                  description = value;
                                },
                                validation: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Please Enter Your User Name';
                                  } else if (value.length > 32) {
                                    return 'Name Must be less than 32 characters';
                                  }
                                },
                              )),
                        ),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (_editProfileKey.currentState!.validate()) {
                          var result = FirebaseAuth.instance;

                          // ignore: unnecessary_null_comparison
                          if (result != null) {
                            FirebaseFirestore.instance
                                .collection(editiProfileCollection)
                                .doc(result.currentUser!.uid)
                                .set({
                              'user_name': _userNameController.text,
                              'email': _userEmailController.text,
                              'description': _descriptionUserController.text,
                            }).then((value) => {
                                      if (true)
                                        {
                                          flutterToast(
                                              msg: 'Edit Profile Successfully',
                                              color: Colors.green)
                                        }
                                    });
                          }
                        }

                        _userNameController.clear();
                        _userEmailController.clear();
                        _descriptionUserController.clear();
                      },
                      animationDuration: const Duration(milliseconds: 300),
                      color: Colors.amber.withOpacity(.3),
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 80, right: 80),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        S.of(context).button_edit_profile,
                        style: const TextStyle(fontFamily: "Rubik"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
