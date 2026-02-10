import 'package:flutter/material.dart';
import 'package:hajmohsen/auth/success_changed_pass_page.dart';
import 'package:hajmohsen/background/login_page_background.dart';
import 'package:hajmohsen/styles/styles.dart';

class NewPassPage extends StatefulWidget {
  final String phoneNumber;
  const NewPassPage({super.key, required this.phoneNumber});

  @override
  State<NewPassPage> createState() => _NewPassPageState();
}

class _NewPassPageState extends State<NewPassPage> {
  String? codeError;
  String? _phoneError;
  String? _passwordError;
  String? _repasswordError;
  bool _showPassword = true;

  void _showPass() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  final TextEditingController _codeNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  void submit() {
  setState(() {
    final code = _codeNumberController.text.trim();
    final pass = _passwordController.text.trim();
    final repass = _repasswordController.text.trim();

    // کد ۵ رقمی
    if (code.isEmpty) {
      codeError = 'کد نمی‌تواند خالی باشد';
    } else if (code.length != 5 || !RegExp(r'^\d{5}$').hasMatch(code)) {
      codeError = 'کد باید ۵ رقمی باشد';
    } else {
      codeError = null;
    }
    // رمز
    if (pass.isEmpty) {
      _passwordError = 'رمز عبور نمی‌تواند خالی باشد';
    } else if (pass.length < 6) {
      _passwordError = 'رمز عبور نمی‌تواند کمتر از ۶ رقم باشد';
    } else {
      _passwordError = null;
    }

    // تکرار رمز
    if (repass.isEmpty) {
      _repasswordError = 'تکرار رمز عبور را وارد کنید';
    } else if (pass != repass) {
      _repasswordError = 'تکرار رمز با رمز عبور تطابق ندارد';
    } else {
      _repasswordError = null;
    }
  });

  // اگر همه چیز درست بود برو صفحه‌ی بعد
  if (codeError == null &&
      _phoneError == null &&
      _passwordError == null &&
      _repasswordError == null) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SuccessChangedPassPage()),
    );
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
              Center(child: Text('رمز عبور جدید', style: h1(context))),
              SizedBox(height: size.height * 0.085),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
                  child: Text(
                    'کد به شماره ${widget.phoneNumber} ارسال شد ',
                    style: h2(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.025,
                  vertical: size.width * 0.045,
                ),
                child: buildOtpNumberTextInput(
                  context,
                  _codeNumberController,
                  'لطفا کد ارسال شده را وارد نمایید',
                  phoneerror: _phoneError,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.025,
                  vertical: size.width * 0.045,
                ),
                child: buildPasswordTextInput(
                  context,
                  _passwordController,
                  'لطفا رمز عبور خود را وارد کنید',
                  obscureText: _showPassword,
                  function: _showPass,
                  passerror: _passwordError,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.025,
                  vertical: size.width * 0.045,
                ),
                child: buildPasswordTextInput(
                  context,
                  _repasswordController,
                  'لطفا رمز عبور خود را دوباره وارد کنید',
                  obscureText: _showPassword,
                  function: _showPass,
                  passerror: _repasswordError,
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
