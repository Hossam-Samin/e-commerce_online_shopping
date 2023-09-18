import 'package:e_commerce/view/screens/app_layout/app_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../constans/app_assets_images/app_assets_images.dart';
import '../../constans/flutter_toast/flutter_toast.dart';
import '../../widgets/custom_textField.dart';
import '../signup/signup.dart';
import '../verification_email_screen/verification_email_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? userEmail, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: _loginKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Image.asset(
                      AppAssets.iconSplashScreen,
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).header_login,
                  style: const TextStyle(fontSize: 18, fontFamily: "Rubik"),
                ),
                const SizedBox(height: 30),
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
                            onSaved: (value) {
                              userEmail = value;
                            },
                            hintText: S.of(context).email_login,
                            validation: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Please Enter Your E-Mail";
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
                            onSaved: (value) {
                              password = value;
                            },
                            hintText: S.of(context).password_login,
                            validation: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Please Enter Your Password";
                              }
                            },
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 250),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const VerificationEmailScreen(),
                          ));
                    },
                    child: Text(
                      S.of(context).forget_password,
                      style: const TextStyle(
                          fontFamily: "Rubik",
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () async {
                    if (_loginKey.currentState!.validate()) {
                      _loginKey.currentState!.save();

                      setState(() {
                        isLoading = true;
                      });

                      try {
                        var credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _userEmailController.text,
                                password: _userPasswordController.text)
                            .then((value) => {
                                  if (true)
                                    {
                                      flutterToast(
                                          msg: 'Login Successfully',
                                          color: Colors.green)
                                    }
                                });

                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AppLayout()));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          flutterToast(
                              msg: 'User not found', color: Colors.red);
                        } else if (e.code == 'wrong-password') {
                          flutterToast(
                              msg: 'Wrong Password', color: Colors.red);
                        }
                      } catch (ex) {
                        flutterToast(
                            msg: 'There is an error', color: Colors.red);
                      }
                      setState(() {
                        isLoading = false;
                      });
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
                    S.of(context).button_login,
                    style: const TextStyle(fontFamily: "Rubik"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).des_login,
                        style: const TextStyle(
                            fontFamily: "Rubik", color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                              (route) => false);
                        },
                        child: Text(
                          S.of(context).signup_in_login,
                          style: TextStyle(
                              fontFamily: "Rubik",
                              color: Colors.redAccent.shade200),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          S.of(context).or,
                          style: const TextStyle(fontFamily: "Rubik"),
                        ),
                      ),
                      const Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.only(right: 40, left: 30),
                          trailing: Text(S.of(context).facebook_login,
                              style: const TextStyle(fontFamily: "Rubik")),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.amber.shade200)),
                          leading:
                              Image.asset(AppAssets.socialFacebook, height: 30),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.only(right: 60, left: 30),
                          trailing: Text(S.of(context).google_login,
                              style: const TextStyle(fontFamily: "Rubik")),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.amber.shade200)),
                          leading:
                              Image.asset(AppAssets.socialGoogle, height: 25),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
