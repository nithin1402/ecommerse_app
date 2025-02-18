import 'package:ecommerce_app/screens/bloc/home_bloc.dart';
import 'package:ecommerce_app/screens/bloc/home_event.dart';
import 'package:ecommerce_app/screens/bloc/home_state.dart';
import 'package:ecommerce_app/screens/on_boarding/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils_helper.dart';

class SignUpPage extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
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
            Text("SignUp to create an Account",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 22),),
            mHeight(),
            TextField(
              controller: nameController,
              decoration: mTextFieldDecoration(
                  hintText: "Enter your name here..",
                  lableText: "Name",
                  prefixIcon: Icon(Icons.person)
              ),
            ),
            mHeight(),
            TextField(
              controller: mobileController,
              decoration: mTextFieldDecoration(
                  hintText: "Enter your phone no here..",
                  lableText: "Mobile",
                  prefixIcon: Icon(Icons.lock)
              ),
            ),
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
                  hintText: "Enter your password no here..",
                  lableText: "Password",
                  prefixIcon: Icon(Icons.lock)
              ),
            ),
            mHeight(),
            BlocListener<HomeBloc,HomeState>(
              listener: (_,state){
                if(state is HomeErrorState){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                }
                if(state is HomeLoadedState){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Register Successfully")));
                  Navigator.pop(context);
                }
              },
              child: ElevatedButton(onPressed: (){

                String name = nameController.text.toString();
                String mobile = mobileController.text.toString();
                String email = emailController.text.toString();
                String pass = passController.text.toString();

                context.read<HomeBloc>().add(RegisterUserEvent(bodyPrams: {
                  "name" : name,
                  "mobile_number" : mobile,
                  "email" : email,
                  "password" : pass
                }));



              }, child: Text("SignUp")),
            ),
            mHeight(mHeight: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                InkWell(
                  onTap: () {
                   Navigator.pop(context);
                  },
                    child: Text("Login",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
