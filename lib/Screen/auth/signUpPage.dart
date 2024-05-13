
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widget/ui.dart';
import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.customAlertBox(context, "Enter Email and Password");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const LoginPage())));
      } on FirebaseAuthException catch (ex) {
        return UiHelper.customAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           const SizedBox(height: 100,),
            UiHelper.customTextField(nameController, "Name", Icons.person, false,
                TextInputType.name),
            UiHelper.customTextField(phoneController, "Phone Number", Icons.phone, false,
                TextInputType.phone),

            UiHelper.customTextField(emailController, "Email", Icons.email, false,
                TextInputType.emailAddress),
            UiHelper.customTextField(passwordController, "password",
                Icons.password, true, TextInputType.visiblePassword),
            UiHelper.customButton(() {
              signUp(emailController.text, passwordController.text);
            }, "SignUp") ,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already Have an Account"),
                TextButton(onPressed: (){
                  Navigator.pushReplacement (context, MaterialPageRoute(builder: (context)=>const  LoginPage()))
                  ;            }, child: const Text("SignIn" , style: TextStyle(fontSize: 16 , color: Colors.blue),))
              ],)
          ],
        ),
      ),
    );
  }
}
