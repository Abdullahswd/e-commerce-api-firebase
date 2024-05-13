import 'package:e_commerce_api/Screen/auth/signUpPage.dart';
import 'package:e_commerce_api/Screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widget/ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email , String password) async{
    if(email =="" && password==""){
      UiHelper.customAlertBox(context, "Enter Email and Password");
    } else{UserCredential? userCredential;
     try{

       userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
           .then((value) =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const HomeScreen())));


     }on FirebaseAuthException catch(ex){
       UiHelper.customAlertBox(context, ex.code.toString());
     }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.customTextField(emailController, "Email", Icons.mail, false , TextInputType.emailAddress),
          UiHelper.customTextField(passwordController, "Password", Icons.password, true , TextInputType.visiblePassword),
          UiHelper.customButton(() {
            login(emailController.text, passwordController.text);
          }, "Login") ,
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text("Don't Have an Account"),
            TextButton(onPressed: (){
              Navigator.pushReplacement (context, MaterialPageRoute(builder: (context)=>const  SignUpPage()))
;            }, child: const Text("Sign Up" , style: TextStyle(fontSize: 16 , color: Colors.blue),))
          ],)

        ],
      ),
    );
  }
}
