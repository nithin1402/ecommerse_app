import 'package:ecommerce_app/screens/on_boarding/sign_up_page.dart';
import 'package:ecommerce_app/utils/utils_helper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login to your Account",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 22),),
            mHeight(),
            TextField(
              controller: emailController,
              decoration: mTextFieldDecoration(
                  hintText: "Enter your email here..",
                lableText: "Email",
                prefixIcon: Icon(Icons.person)
              ),
            ),
            mHeight(),
            TextField(
              controller: passController,
              decoration: mTextFieldDecoration(
                  hintText: "Enter your pass here..",
                  lableText: "Password",
                  prefixIcon: Icon(Icons.lock)
              ),
            ),
            mHeight(),
            ElevatedButton(onPressed: (){}, child: Text("Login")),
            mHeight(mHeight: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                    },
                    child: Text("SignUp",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
