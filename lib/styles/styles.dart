import 'package:flutter/material.dart';

TextStyle regularpersian(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.035,
  fontWeight: FontWeight.bold,
  color: Theme.of(context).colorScheme.onSurface,
  fontFamily: 'BNazanin',
);
TextStyle alertDialogStyle(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.035,
  fontWeight: FontWeight.w200,
  color: Theme.of(context).colorScheme.onSurface,
  fontFamily: 'BNazanin',
);
TextStyle alertDialogStyleRemove(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.04,
  fontWeight: FontWeight.w200,
  color: Colors.red,
  fontFamily: 'BNazanin',
);
TextStyle alertDialogStyleAdd(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.04,
  fontWeight: FontWeight.w200,
  color: Colors.blue,
  fontFamily: 'BNazanin',
);
TextStyle alertDialogStyleCancel(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.035,
  fontWeight: FontWeight.w200,
  color: Colors.black,
  fontFamily: 'BNazanin',
);
TextStyle choiceChipstyle(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.035,
  fontWeight: FontWeight.bold,
  color: Theme.of(context).colorScheme.onSurface,
  fontFamily: 'BNazanin',
);
TextStyle hintTextStyle(BuildContext context) => TextStyle(
  fontFamily: 'Kayrawan',
  color: Colors.black38,
  fontSize: MediaQuery.of(context).size.width * 0.03,
);
TextStyle regular(BuildContext context) => TextStyle(
  fontFamily: 'Kayrawan',
  color: Colors.black87,
  fontSize: MediaQuery.of(context).size.width * 0.03,
);
TextStyle voteStyle(BuildContext context) => TextStyle(
  fontFamily: 'Kayrawan',
  color: Colors.black38,
  fontSize: MediaQuery.of(context).size.width * 0.045,
);
TextStyle buttontext(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.038,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontFamily: 'BNazanin',
);
TextStyle wordStyle(BuildContext context) => TextStyle(
  fontFamily: 'Besmellah',
  fontSize: MediaQuery.of(context).size.width * 0.07,
  fontWeight: FontWeight.bold,
  color: const Color.fromARGB(255, 253, 152, 0),
);
TextStyle regularLatin(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.038,
  fontWeight: FontWeight.w700,
  color: Theme.of(context).colorScheme.onSurface,
  fontFamily: 'PlayfairDisplay',
);
TextStyle userNameLatin(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.048,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontFamily: 'PlayfairDisplay',
);
TextStyle h1(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.045,
  fontWeight: FontWeight.bold,
  color: const Color.fromARGB(255, 253, 152, 0),
  fontFamily: 'BNazanin',
);
TextStyle title(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.055,
  fontWeight: FontWeight.bold,
  // color: const Color.fromARGB(255, 253, 152, 0),
  fontFamily: 'BNazanin',
);
TextStyle itemsPrice(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.055,
  fontWeight: FontWeight.bold,
  color: const Color.fromARGB(255, 253, 152, 0),
  fontFamily: 'BNazanin',
);

TextStyle h2(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.04,
  fontWeight: FontWeight.bold,
  color: const Color.fromARGB(255, 253, 152, 0),
  fontFamily: 'BNazanin',
);
TextStyle description(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.04,
  fontWeight: FontWeight.bold,
  // color: const Color.fromARGB(255, 253, 152, 0),
  fontFamily: 'BNazanin',
  height: 1.8,
);
TextStyle showDialogStyle(BuildContext context) => TextStyle(
  fontSize: MediaQuery.of(context).size.width * 0.05,
  fontWeight: FontWeight.w500,
  fontFamily: 'BNazanin',
  height: 1.8,
);
Widget buildUserNameTextInput(
  BuildContext context,
  TextEditingController controller,
  String hinttext, {
  bool obscureText = false,
  String? errorText,
}) {
  return TextField(
    controller: controller,
    textDirection: TextDirection.ltr,
    obscureText: obscureText,
    style: regularLatin(context),
    cursorColor: Color(0XFF1B1B1E),

    decoration: InputDecoration(
      hintText: hinttext,
      hintStyle: hintTextStyle(context),
      errorText: errorText,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0xFFEF9B0F), width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.orange, width: 1.5),
      ),
      filled: true,
      fillColor: Colors.transparent,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.orange),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}

Widget buildEmailTextInput(
  BuildContext context,
  TextEditingController controller,
  String hinttext, {
  bool obscureText = false,
  String? textError,
}) {
  return TextField(
    controller: controller,
    textDirection: TextDirection.ltr,
    obscureText: obscureText,
    style: regularLatin(context),
    cursorColor: Color(0XFF1B1B1E),

    decoration: InputDecoration(
      hintText: hinttext,
      hintStyle: hintTextStyle(context),
      errorText: textError,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0xFFEF9B0F), width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.orange, width: 1),
      ),
      filled: true,
      fillColor: Colors.transparent,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.orange),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}

Widget buildPasswordTextInput(
  BuildContext context,
  TextEditingController controller,
  String hinttext, {
  required bool obscureText,
  void Function()? function,
  passerror,
}) {
  return TextField(
    controller: controller,
    textDirection: TextDirection.ltr,
    obscureText: obscureText,
    style: regularLatin(context),
    cursorColor: Color(0XFF1B1B1E),

    decoration: InputDecoration(
      suffixIcon: IconButton(
        onPressed: function,
        icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
      ),
      hintText: hinttext,
      hintStyle: hintTextStyle(context),
      errorText: passerror,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0xFFEF9B0F), width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.orange, width: 1),
      ),
      filled: true,
      fillColor: Colors.transparent,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.orange),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}

Widget buildPhoneNumberTextInput(
  BuildContext context,
  TextEditingController controller,
  String hinttext, {
  phoneerror,
}) {
  return TextField(
    controller: controller,
    textDirection: TextDirection.ltr,
    keyboardType: TextInputType.number,
    style: regularLatin(context),
    cursorColor: Color(0XFF1B1B1E),
    decoration: InputDecoration(
      hintText: hinttext,
      hintStyle: hintTextStyle(context),
      errorText: phoneerror,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0xFFEF9B0F), width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.orange, width: 1),
      ),
      filled: true,
      fillColor: Colors.transparent,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.orange),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}

Widget buildOtpNumberTextInput(
  BuildContext context,
  TextEditingController controller,
  String hinttext, {
  phoneerror,
}) {
  return TextField(
    controller: controller,
    textDirection: TextDirection.ltr,
    keyboardType: TextInputType.number,
    style: regularLatin(context),
    cursorColor: Color(0XFF1B1B1E),
    decoration: InputDecoration(
      hintText: hinttext,
      hintStyle: hintTextStyle(context),
      errorText: phoneerror,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Color(0xFFEF9B0F), width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.orange, width: 1),
      ),
      filled: true,
      fillColor: Colors.transparent,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.orange),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}

Widget buildButton(BuildContext context, String text, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFFBEC5D).withAlpha(150),
      minimumSize: Size(double.infinity, 50),
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.017,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
    child: Text(text, style: buttontext(context)),
  );
}
