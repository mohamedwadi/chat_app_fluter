
import 'package:chat_app_fluter/custom_wedjet/custom_text.dart';
import 'package:chat_app_fluter/model/massage_model/massage.dart';
import 'package:chat_app_fluter/resourses/manager_color/manage_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MassageChatFrinds extends StatelessWidget {
  const MassageChatFrinds({Key? key ,this.color = ManageColor.color_chat_frinds , required this.massage}) : super(key: key);

  final Color  color ;
  final Massage massage;

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsetsDirectional.all(8),
        padding: EdgeInsetsDirectional.all(17),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(

                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(12)

            ),
            color: color
        ),
        child: CustomText(
          text: '${massage.massage}',
          color: Colors.white,
        ),
      ),
    );
  }
}
