import 'package:flutter/material.dart';
import 'package:hajmohsen/auth/forget_pass_page.dart';
import 'package:hajmohsen/auth/sign_up_page.dart';
import 'package:hajmohsen/background/login_page_background.dart';
import 'package:hajmohsen/database/db_helper.dart';
import 'package:hajmohsen/styles/styles.dart';
import 'package:hajmohsen/users/pages/main_page.dart';
import 'package:hajmohsen/users/providers/auth_providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode _userNameFocusNode = FocusNode();
  String? userNameErorr;
  String? passwordError;
  bool showPassword = true;

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    _userNameFocusNode.dispose();
    super.dispose();
  }

  void showPass() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void login() async {
   FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      userNameErorr = userNameController.text.trim().isEmpty
          ? 'نام کاربری نمیتواند خالی باشد '
          : null;

      passwordError = passwordController.text.trim().isEmpty
          ? 'رمز عبور نمیتواند خالی باشد '
          : passwordController.text.length < 6
          ? 'رمز عبور نمیتواند کمتر از ۶ رقم باشد'
          : null;
    });

    if (userNameErorr != null || passwordError != null) return;

     final user = await DbHelper.getUser(
  userNameController.text.trim(),
  passwordController.text.trim(),
);


if (user != null) {

  if (!mounted) return;

  context.read<AuthProviders>().loggin(user['username']);

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const MainPage()),
  );
} else {
  if (!mounted) return;
  
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('نام کاربری یا رمز اشتباه است')),
  );
}

  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', userNameController.text);
    prefs.setString('password', passwordController.text);
  }

  // Future<void> loadData() async {
  //   final prefs=await SharedPreferences.getInstance();
  //   final String? savedUserName = prefs.getString('username');
  //   final String? savedPassword = prefs.getString('password');

  // }

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
                  SizedBox(height: size.height * 0.085),
                  Center(
                    child: Text(
                      'برای هر لحظه، یک نوشیدنی خاص',
                      style: TextStyle(
                        fontFamily: 'Besmellah',
                        fontSize: size.width * 0.065,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 253, 152, 0),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.055),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.01,
                    ),
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
                      focusNode: _userNameFocusNode,
                      onTapFunction: () async {
                        _userNameFocusNode.unfocus();
                        final prefs = await SharedPreferences.getInstance();
                        final savedUserName = prefs.getString('username');
                        final savedPassword = prefs.getString('password');
                        if (savedUserName != null || savedPassword != null) {
                          if (!context.mounted) return;
                          final shouldAutofill = await showDialog<bool>(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('اطلاعات ذخیره شده یافت شد',
                                style: showDialogStyleLogin(context)
                                ),
                                content: Text('مایل به پر کردن خودکار هستید؟',
                                style: alertDialogStyle(context)
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, false);
                                    },
                                    child: Text('خیر',
                                    style: alertDialogStyle(context)
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    child: Text('بله',
                                    style: alertDialogStyleRemoveLogin(context)
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                          if (shouldAutofill == true) {
                            userNameController.text = savedUserName!;
                            passwordController.text = savedPassword!;
                          } else {
                            if (!context.mounted) return;
                            FocusScope.of(
                              context,
                            ).requestFocus(_userNameFocusNode);
                          }
                        }
                      },
                      'لطفا نام کاربری خود را وارد کنید',
                      errorText: userNameErorr,
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
                    padding: EdgeInsets.only(bottom: size.height * 0.035),
                    child: buildPasswordTextInput(
                      context,
                      passwordController,
                      obscureText: showPassword,
                      'لطفا رمز عبور خود را وارد کنید',
                      passerror: passwordError,
                      function: showPass,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ForgetPassPage()),
                        );
                      },
                      child: Text(
                        'فراموشی رمز عبور؟',
                        style: TextStyle(
                          fontFamily: 'Besmellah',
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 253, 152, 0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
                    child: buildButton(context, 'ورود', () => login()),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignUpPage()),
                      );
                    },
                    child: Text(
                      'ایجاد حساب کاربری جدید',
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
