import 'package:flutter/material.dart';
import 'package:hajmohsen/auth/new_pass_page.dart';
import 'package:hajmohsen/background/login_page_background.dart';
import 'package:hajmohsen/styles/styles.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({super.key});

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  String? phoneError;
  final TextEditingController _phoneNumberController = TextEditingController();
  void submit() {
    setState(() {
      final phone = _phoneNumberController.text.trim();
      if (phone.isEmpty) {
        phoneError = 'شماره تلفن نمیتواند خالی باشد';
      } else if (!RegExp(r'^(?:\+98|0098|0)?9\d{9}$').hasMatch(phone)) {
        phoneError = 'شماره تلفن معتبر نیست';
      } else {
        phoneError = null;
      }
    });
    if (phoneError == null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => NewPassPage(phoneNumber: _phoneNumberController.text.trim(),)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LoginPageBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.2),
                    child: Text(
                      'حاج محسن',
                      style: TextStyle(
                        fontFamily: 'Besmellah',
                        fontSize: size.width * 0.115,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 253, 152, 0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              Center(
                child: Text(
                  'رمز عبور خود را فراموش کرده اید؟',
                  style: h2(context),
                ),
              ),
              SizedBox(height: size.height * 0.085),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
                  child: Text('شماره تماس', style: h2(context)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.025,
                  vertical: size.width * 0.045,
                ),
                child: buildPhoneNumberTextInput(
                  context,
                  _phoneNumberController,
                  'لطفا شماره تماس خود را وارد نمایید',
                  phoneerror: phoneError,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.025,
                  vertical: size.height * 0.055,
                ),
                child: buildButton(context, 'تایید', submit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
