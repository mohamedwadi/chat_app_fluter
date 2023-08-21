import 'package:flutter/material.dart';

class CustomTextFormFailed extends StatelessWidget {
   CustomTextFormFailed({
    super.key,required this.text,required this.onChange
  });
  String text = '';
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:(data){
      if(data!.length < 5){
        return 'fasle';
      }
      },
      onChanged: onChange,
    style: TextStyle(
      color: Colors.white
    ),
      decoration: InputDecoration(
          hintStyle:  TextStyle(
              color: Colors.grey
          ),
          hintText: '$text',
          border:  OutlineInputBorder(
            //borderRadius: BorderRadius.circular(500),
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          enabledBorder:  OutlineInputBorder(
             // borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:Colors.blue,
            )
        )
      ),
    );
  }
}