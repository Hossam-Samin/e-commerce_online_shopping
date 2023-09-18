import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/view/constans/app_assets_images/app_assets_images.dart';
import 'package:e_commerce/view/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constans/flutter_toast/flutter_toast.dart';
import '../../constans/keys/keys.dart';
import '../../widgets/custom_textField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final TextEditingController _userNameController = TextEditingController();
final TextEditingController _userEmailController = TextEditingController();
final TextEditingController _userPasswordController = TextEditingController();
final TextEditingController _confirmPasswordController =
    TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
bool isLoading = false;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? userName, userEmail, password, confirmPassword, phoneNumber;

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: _registerKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Image.asset(
                      AppAssets.iconSplashScreen,
                      fit: BoxFit.cover,
                      height: 120,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    S.of(context).header_signup,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Rubik",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 220),
                  child: Text(
                    S.of(context).create_account,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Rubik",
                      color: Colors.blueGrey,
                    ),
                  ),
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
                            hintText: S.of(context).username_signup,
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
                            hintText: S.of(context).email_signup,
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
                        Icons.password_rounded,
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
                            isObscureText: true,
                            controller: _userPasswordController,
                            onChange: (value) {},
                            hintText: S.of(context).password_signup,
                            onSaved: (value) {
                              password = value;
                            },
                            validation: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please Enter Your Password';
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
                        Icons.password_rounded,
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
                            isObscureText: true,
                            controller: _confirmPasswordController,
                            onChange: (value) {},
                            hintText: S.of(context).confirm_password_signup,
                            onSaved: (value) {
                              confirmPassword = value;
                            },
                            validation: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please Enter Your confirm Password';
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
                        Icons.call_rounded,
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
                            keyboardType: TextInputType.number,
                            controller: _phoneController,
                            onChange: (value) {},
                            hintText: S.of(context).phone_signup,
                            onSaved: (value) {
                              phoneNumber = value;
                            },
                            validation: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please Enter Your Phone Number';
                              } else if (value.length > 11) {
                                return "Please Enetr Valid Number";
                              }
                            },
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () async {
                    if (_registerKey.currentState!.validate()) {
                      _registerKey.currentState!.save();
                      setState(() {
                        isLoading = true;
                      });

                      var result = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _userEmailController.text,
                        password: _userPasswordController.text,
                      );

                      if (result != null) {
                        FirebaseFirestore.instance
                            .collection(userCollection)
                            .doc(result.user?.uid)
                            .set({
                          "user_name": _userNameController.text,
                          "email": _userEmailController.text,
                          "password": _userPasswordController.text,
                          "confirm_password": _confirmPasswordController.text,
                          "phone_num": _phoneController.text,
                        }).then((value) {
                          if (true) {
                            flutterToast(
                                msg: 'Registered Successfully',
                                color: Colors.green);
                          }
                        });
                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        flutterToast(
                            msg: 'The Network is off or email is already',
                            color: Colors.red);
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  animationDuration: const Duration(milliseconds: 300),
                  color: Colors.amber.withOpacity(.3),
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 80, right: 80),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    S.of(context).button_signup,
                    style: const TextStyle(fontFamily: "Rubik"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).des_signup,
                        style: const TextStyle(
                            fontFamily: "Rubik", color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false);
                        },
                        child: Text(
                          S.of(context).login_in_signup,
                          style: TextStyle(
                              fontFamily: "Rubik",
                              color: Colors.redAccent.shade200),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
