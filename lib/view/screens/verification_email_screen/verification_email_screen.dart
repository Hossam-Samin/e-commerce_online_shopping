import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/view/constans/app_assets_images/app_assets_images.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import '../../constans/flutter_toast/flutter_toast.dart';
import '../../widgets/custom_textField.dart';
import 'otp_screen.dart';

class VerificationEmailScreen extends StatefulWidget {
  const VerificationEmailScreen({super.key});

  @override
  State<VerificationEmailScreen> createState() =>
      _VerificationEmailScreenState();
}

class _VerificationEmailScreenState extends State<VerificationEmailScreen> {
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  EmailOTP myAuth = EmailOTP();

  // void sendOTP() async {
  //   EmailAuth(sessionName: "Test Session");
  //   var res = await EmailAuth()
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 50, right: 340, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.amber.shade100,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              const SizedBox(height: 40),
              Center(
                child: Text(S.of(context).header_verify,
                    style: const TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 22,
                    )),
              ),
              const SizedBox(height: 40),
              Image.asset(
                AppAssets.forgetPassword,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 60),
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
                        color: Colors.grey.shade200,
                        elevation: .5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CustomTextField(
                          controller: userEmailController,
                          onChange: (value) {},
                          hintText: S.of(context).forget_pass_by_email,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              MaterialButton(
                onPressed: () async {
                  myAuth.setConfig(
                    appEmail: "hossam@gmail.com",
                    appName: "E-Mail OTP",
                    otpLength: 4,
                    userEmail: userEmailController.text,
                    otpType: OTPType.digitsOnly,
                  );
                  if (await myAuth.sendOTP() == true) {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("OTP has been sent"),
                    ));
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpScreen(
                                  myauth: myAuth,
                                )));
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Oops, OTP send failed"),
                    ));
                  }
                },
                color: Colors.amber.shade100,
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 80, right: 80),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  S.of(context).verify_email,
                  style: const TextStyle(fontFamily: "Rubik"),
                ),
              ),
            ],
          ),
        )));
  }
}
