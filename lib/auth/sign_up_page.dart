import 'package:flutter/material.dart';
import 'package:hajmohsen/auth/login_page.dart';
import 'package:hajmohsen/background/login_page_background.dart';
import 'package:hajmohsen/database/db_helper.dart';
import 'package:hajmohsen/styles/styles.dart';
import 'package:hajmohsen/users/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  String? userNameErorr;
  String? phoneNumberError;
  String? passwordError;
  String? repasswordError;
  bool showPassword = true;
  @override
  void dispose() {
    userNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    super.dispose();
  }

  void showPass() {
    setState(() {
      showPassword = !showPassword;
    });
  }

void signup() async {
  setState(() {
    userNameErorr = userNameController.text.trim().isEmpty
        ? 'نام کاربری نمیتواند خالی باشد '
        : null;

    phoneNumberError = phoneNumberController.text.trim().isEmpty
        ? 'شماره تماس نمیتواند خالی باشد'
        : !RegExp(r'^(?:\+98|0098|0)?9\d{9}$')
            .hasMatch(phoneNumberController.text.trim())
        ? 'شماره تماس معتبر نیست'
        : null;

    passwordError = passwordController.text.trim().isEmpty
        ? 'رمز عبور نمیتواند خالی باشد '
        : passwordController.text.length < 6
        ? 'رمز عبور نمیتواند کمتر از ۶ رقم باشد'
        : null;

    repasswordError = repasswordController.text.trim().isEmpty
        ? 'رمز عبور نمیتواند خالی باشد '
        : repasswordController.text.length < 6
        ? 'رمز عبور نمیتواند کمتر از ۶ رقم باشد'
        : null;

    if (passwordController.text != repasswordController.text) {
      repasswordError = 'تکرار رمز عبور با رمز عبور تطابق ندارد';
    }
  });

  if (userNameErorr != null || phoneNumberError != null ||
      passwordError != null || repasswordError != null){
         return;
      }




  final existingUser =
      await DbHelper.getByUserName(userNameController.text.trim());

  if (existingUser != null) {
    if(!mounted)return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('این نام قبلاً ثبت شده')),
    );
    return;
  }


  final success = await DbHelper.insertuser(
    userNameController.text.trim(),
    passwordController.text.trim(),
  );

  if (success) {
    if(!mounted)return;
     Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const MainPage()),
    );


    userNameController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    repasswordController.clear();

  } else {
    if(!mounted)return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('خطا در ثبت نام')),
    );
  }
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', userNameController.text.trim());
  await prefs.setString('password', passwordController.text.trim());
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LoginPageBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.055,
                vertical: size.height * 0.025,
              ),
              child: Column(
                children: [
                  Center(
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
                  SizedBox(height: size.height * 0.055),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('نام کاربری', style: wordStyle(context)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.035),
                    child: buildUserNameTextInput(
                      context,
                      userNameController,
                      'لطفا نام کاربری خود را وارد کنید',
                      errorText: userNameErorr,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('شماره همراه', style: wordStyle(context)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.035),
                    child: buildPhoneNumberTextInput(
                      context,
                      phoneNumberController,
                      'لطفا  شماره همراه خود را وارد کنید',
                      phoneerror: phoneNumberError,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('رمز عبور', style: wordStyle(context)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.035,
                    ),
                    child: buildPasswordTextInput(
                      context,
                      passwordController,
                      'لطفا رمز عبور خود را وارد کنید',
                      obscureText: showPassword,
                      function: showPass,
                      passerror: passwordError,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.01),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('تکرار رمز عبور', style: wordStyle(context)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height * 0.035,
                    ),
                    child: buildPasswordTextInput(
                      context,
                      repasswordController,
                      'لطفا رمز عبور خود را دوباره وارد کنید',
                      obscureText: showPassword,
                      function: showPass,
                      passerror: passwordError,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
                    child: buildButton(context, 'ثبت نام', () => signup()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    },
                    child: Text(
                      'آیا از قبل حساب کاربری دارید؟ وارد شوید',
                      style: TextStyle(
                        fontFamily: 'Besmellah',
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 253, 152, 0),
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
