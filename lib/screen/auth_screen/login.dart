import 'package:chat_app_fluter/custom_wedjet/custom_button.dart';
import 'package:chat_app_fluter/custom_wedjet/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../const_images/images.dart';
import '../../custom_wedjet/custom_text_form_failed.dart';
import '../../resourses/manager_color/manage_color.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routes/routes.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  String input_user_email = '';
  String input_user_password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Login',
          size: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              Images.image_login,
              height: 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Chat App',
                  size: 17,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextFormFailed(
              onChange: (data) {
                input_user_email = data;
              },
              text: 'Email',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormFailed(
              onChange: (data) {
                input_user_password = data;
              },
              text: 'Password',
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              onTap: () {
                login(context);
              },
              text: 'Login',
              color: Color(0xff4477CE),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'dont I have an account ? ',
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.registers_screen);
                  },
                  child: CustomText(
                    text: 'Registers',
                    size: 16,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: ManageColor.color_primary_app,
    );
  }

  Future<void> login(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: input_user_email,
        password: input_user_password,
      );
      snackBar(context, "Login Sucess");
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushNamed(context, Routes.chat_screen , arguments: input_user_email);
      });
    } catch (e) {
      print(e);
      snackBar(context, 'Error in password or Email');
    }
  }
  void snackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }


}

