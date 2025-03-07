import 'package:ecommerce_app/screens/bloc/home_bloc.dart';
import 'package:ecommerce_app/screens/bloc/home_event.dart';
import 'package:ecommerce_app/screens/bloc/home_state.dart';
import 'package:ecommerce_app/screens/on_boarding/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/utils_helper.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool isEmailValid({required String email})=> RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

  GlobalKey<FormState> mKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: mKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SignUp to create an Account",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 22),),
              mHeight(),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Please fill your name";
                  }else {
                    return null;
                  }
                },
                controller: nameController,
                decoration: mTextFieldDecoration(
                    hintText: "Enter your name here..",
                    lableText: "Name",
                    prefixIcon: Icon(Icons.person)
                ),
              ),
              mHeight(),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Please fill the mobile no";
                  }else if(value.length!=10){
                    return "Please enter a valid mobile no";
                  }else {
                    return null;
                  }
                },
                controller: mobileController,
                decoration: mTextFieldDecoration(
                    hintText: "Enter your phone no here..",
                    lableText: "Mobile",
                    prefixIcon: Icon(Icons.lock)
                ),
              ),
              mHeight(),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Please fill the email";
                  }else if(!isEmailValid(email: value)){
                    return "Please enter a valid email";
                  }else {
                    return null;
                  }
              },
                controller: emailController,
                decoration: mTextFieldDecoration(
                    hintText: "Enter your email here..",
                    lableText: "Email",
                    prefixIcon: Icon(Icons.person)
                ),
              ),
              mHeight(),
              TextFormField(
                controller: passController,
                decoration: mTextFieldDecoration(
                    hintText: "Enter your password no here..",
                    lableText: "Password",
                    prefixIcon: Icon(Icons.lock)
                ),
              ),
              mHeight(),

               BlocListener<HomeBloc, HomeState>(
                    listener: (_, state) {
                      if(state is HomeLoadingState){
                        isLoading=true;
                        setState(() {

                        });
                      }
                      if (state is HomeErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.errorMsg)));
                        isLoading=false;
                        setState(() {

                        });
                      }
                      if (state is HomeLoadedState) {
                        isLoading = false;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Register Successfully")));
                        Navigator.pop(context);
                      }
                    },
                    child: ElevatedButton(
                        onPressed: () {
                          if (mKey.currentState!.validate()) {
                            String name = nameController.text.toString();
                            String mobile = mobileController.text.toString();
                            String email = emailController.text.toString();
                            String pass = passController.text.toString();

                            context.read<HomeBloc>().add(
                                RegisterUserEvent(bodyPrams: {
                                  "name": name,
                                  "mobile_number": mobile,
                                  "email": email,
                                  "password": pass
                                }));
                          }
                        },
                        child: isLoading ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Signing up..."),
                        SizedBox(width: 11,),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(color: Colors.white,),
                        )
                      ],
                    ) : Text("Sigup")
                    ),

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
      ),
    );
  }
}
