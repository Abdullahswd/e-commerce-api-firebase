import 'package:flutter/material.dart';

class UiHelper{
  static customTextField(TextEditingController controller , String text , IconData iconData , bool toHide ,TextInputType textInputType ){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: textInputType,
        controller:  controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))
        ),
      ),
    );

  }

  static customButton(VoidCallback voidCallback , String text){
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(onPressed:  (){
        voidCallback();
      },child: Text(text , style: const TextStyle(color: Colors.black , fontSize: 20),),),
    );
  }

  static customAlertBox(BuildContext context , String text ){
return showDialog(context: context, builder:(BuildContext context){
  return AlertDialog(
    title: Text(text),
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: const Text("OK"))
    ],
  );
} );
  }
}