import 'package:flutter/material.dart';
import 'package:chat_app_fluter/custom_wedjet/custom_text.dart';
import '../../custom_wedjet/custom_text_form_failed.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    super.key,
     required this.onTap,
     this.text = '',
     this.color = Colors.white
  });
  VoidCallback onTap;
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5)
        ),
        child: CustomText(text: text, size: 20, color: Colors.black,),
      ),
    );
  }
}
