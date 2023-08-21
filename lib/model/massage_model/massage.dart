import 'package:flutter/material.dart';

class Massage{

  String massage;
  String email;
  Massage({ required this.massage, required this.email});

  factory Massage.fromJasonToObject(jasonData){

    return Massage(massage : jasonData['massage'] ,email: jasonData['email'] );
  }
}