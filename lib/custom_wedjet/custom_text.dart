import 'package:chat_app_fluter/resourses/manager_color/manage_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
   CustomText({
    super.key,
     this.size = 14,
     this.color = ManageColor.color_text_app
     ,this.text = ''
  });
  double size;
  Color color;
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.nunito(
        fontSize: size,
        color: color,
      ),
    );
  }
}
