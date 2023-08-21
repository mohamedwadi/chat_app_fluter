import 'package:chat_app_fluter/custom_wedjet/custom_button.dart';
import 'package:chat_app_fluter/custom_wedjet/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../const_images/images.dart';
import '../../custom_wedjet/custom_text_form_failed.dart';
import '../../resourses/manager_color/manage_color.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/routes.dart';

class Registers extends StatelessWidget {
  Registers({Key? key}) : super(key: key);
  String input_user_email = '';
  String input_user_password = '';
  GlobalKey <FormState> form_key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Registers',
            size: 20,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: form_key,
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
                  text: 'email',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFailed(
                  onChange: (data) {
                    input_user_password = data;
                  },
                  text: 'password',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                   // fun: () async{
                   //   await create_new_user(context);
                   // },
                  //async{
                  //   FirebaseAuth  auth =  FirebaseAuth.instance;
                  //   UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                  //    email: '',
                  //   password: "");
                  //   print('object');
                  // },
                  onTap: () async {
                    if (form_key.currentState!.validate()){
                      await create_new_user(context);
                      snackBar(context , "sucess add");
                    }else{
                      snackBar(context , "failer add");
                    }
                  },
                  color: Color(0xff4477CE),
                  text: 'Registers',
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'I have an account ? ',
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomText(
                        text: 'Login',
                        size: 16,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        backgroundColor: ManageColor.color_primary_app,
      ),
    );
  }

  Future<void> create_new_user(BuildContext context) async {
     try {
      UserCredential userCredential = await FirebaseAuth
          .instance
          .createUserWithEmailAndPassword(
          email: input_user_email,
          password: input_user_password);
      snackBar(context, 'sucess regaster');
      Future.delayed(
        Duration(seconds: 1),() {
        Navigator.pushNamed(context, Routes.chat_screen ,arguments: input_user_email);
      }
    );
     } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      print("yes");
    }
  }

  void snackBar(BuildContext context , String text) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
