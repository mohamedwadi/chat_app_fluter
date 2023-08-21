
import 'package:chat_app_fluter/custom_wedjet/custom_text.dart';
import 'package:chat_app_fluter/custom_wedjet/massage_chat.dart';
import 'package:chat_app_fluter/custom_wedjet/massage_chat_frinds.dart';
import 'package:chat_app_fluter/model/massage_model/massage.dart';
import 'package:chat_app_fluter/resourses/manager_color/manage_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  CollectionReference<dynamic> massage =
      FirebaseFirestore.instance.collection('massage');

 // dynamic massage = FirebaseFirestore.instance.collection('massage');
  // CollectionReference<Map<String , dynamic>> massage = FirebaseFirestore.instance.collection('massage');

  String massage_click_icon = '';
  TextEditingController controller = TextEditingController();
  final scroal_conroaler = ScrollController();
  @override

  Widget build(BuildContext context) {

    String email = ModalRoute.of(context)!.settings.arguments as String;

    return StreamBuilder<dynamic>(
      stream: massage.orderBy('timeMassage' , descending: true).snapshots(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasData){
          List<Massage> list_massage = [];
          for(int i = 0 ; i<snapshot.data!.docs.length; i++){
            list_massage.add(Massage.fromJasonToObject(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              title: CustomText(
                size: 15,
                text: 'Chat App',
              ),
              backgroundColor: ManageColor.color_primary_app,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: list_massage.length,
                    itemBuilder: (context, index) => list_massage[index].email == email ? MassageChat(massage:list_massage[index])
                        :MassageChatFrinds(massage:list_massage[index],),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.all(12),
                  child: TextField(
                    controller: controller,
                    onChanged: (data) {
                      massage_click_icon = data;
                    },
                    onSubmitted: (data) {
                      if(data.isNotEmpty) {
                        massage.add(
                          {'massage': data,
                            'timeMassage': DateTime.now(),
                            'email' : email,
                          },
                        );
                      }
                      controller.clear();
                      scroal_conroaler.animateTo(0, duration:Duration(microseconds: 500), curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (massage_click_icon != '') {
                            massage.add(
                              {'massage': massage_click_icon,
                                'timeMassage': DateTime.now(),
                                'email' : email,

                              },
                            );
                            massage_click_icon ='';
                            controller.clear();
                            scroal_conroaler.animateTo(0,duration: Duration(microseconds: 500), curve: Curves.easeIn);
                          }

                        },
                        color: ManageColor.color_primary_app,
                        icon: Icon(Icons.send),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: ManageColor.color_primary_app),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ManageColor.color_primary_app),
                        borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(
                child: CustomText(
              text: 'Loading ...',
              size: 20,
              color: ManageColor.color_primary_app,
            )),
          );
        }
      },
    );

  }
}
