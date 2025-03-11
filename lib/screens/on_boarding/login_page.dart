import 'package:ecommerce_app/screens/bloc/home_bloc.dart';
import 'package:ecommerce_app/screens/bloc/home_event.dart';
import 'package:ecommerce_app/screens/bloc/home_state.dart';
import 'package:ecommerce_app/screens/home/home_page.dart';
import 'package:ecommerce_app/screens/on_boarding/sign_up_page.dart';
import 'package:ecommerce_app/utils/utils_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getValueFromPrefs();
  }

  void getValueFromPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    if(token.isNotEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>HomePage()));
    }
  }

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
              obscureText: true,
              obscuringCharacter: "*",
              controller: passController,
              decoration: mTextFieldDecoration(
                  hintText: "Enter your pass here..",
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully")));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                }
              },
              child: ElevatedButton(onPressed: (){
                String email = emailController.text.toString();
                String pass= passController.text.toString();

                context.read<HomeBloc>().add(LoginUserEvent(bodyPrams: {
                  "email" : email,
                  "password" :pass
                }));

              }, child: Text("Login")),
            ),
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
