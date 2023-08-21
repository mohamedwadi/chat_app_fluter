
import 'package:chat_app_fluter/resourses/manager_color/manage_color.dart';
import 'package:chat_app_fluter/routes/routes.dart';
import 'package:chat_app_fluter/screen/auth_screen/login.dart';
import 'package:chat_app_fluter/screen/auth_screen/registers.dart';
import 'package:chat_app_fluter/screen/chat_screen/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Colors.transparent
          // color: ManageColor.color_primary_app
              ,elevation: 0,
              centerTitle: true

        )
      ),
      initialRoute: Routes.login_screen,
      routes: {
        Routes.login_screen : (context) => Login(),
        Routes.registers_screen : (context) => Registers(),
        Routes.chat_screen : (context) => ChatScreen()


      },
    );
  }
}
