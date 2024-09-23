import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constans/app_assets_images/app_assets_images.dart';
import '../app_layout/app_layout.dart';

class OTPVrified extends StatelessWidget {
  const OTPVrified({
    Key? key,
    required this.otpController,
  }) : super(key: key);
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: otpController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onSaved: (value) {},
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
   OtpScreen({super.key, required this.myAuth});
   EmailOTP myAuth = EmailOTP();
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();

  String otpController = "1234";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Image.asset(
                AppAssets.forgetPassword,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Enter Your Verify Number",
              style: TextStyle(fontSize: 18, fontFamily: "Rubik"),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OTPVrified(
                  otpController: otp1Controller,
                ),
                OTPVrified(
                  otpController: otp2Controller,
                ),
                OTPVrified(
                  otpController: otp3Controller,
                ),
                OTPVrified(
                  otpController: otp4Controller,
                ),
              ],
            ),
            const SizedBox(height: 40),
            MaterialButton(
              onPressed: () async {
                if (await EmailOTP.verifyOTP(
                        otp: otp1Controller.text +
                            otp2Controller.text +
                            otp3Controller.text +
                            otp4Controller.text) == true) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("OTP is verified"),
                  ));
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppLayout()));
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Invalid OTP"),
                  ));
                }
              },
              color: Colors.amber.shade100,
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 50, right: 50),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: const Text(
                "Confirm",
                style: TextStyle(fontFamily: "Rubik"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
