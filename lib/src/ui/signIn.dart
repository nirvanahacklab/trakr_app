import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble_example/main.dart';
import 'package:flutter_reactive_ble_example/src/constants/constant_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController username = TextEditingController();
    FocusNode uname = FocusNode();
    final TextEditingController password = TextEditingController();
    FocusNode pass = FocusNode();
    var height=MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(color: background,),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SvgPicture.asset('assets/HacklabLogo1.svg', width: width*0.65,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/AppLogo.png", scale: 0.9,),
                      SizedBox(width: width*0.05,),
                      Text("TRAKR", style: TextStyle(color: highlight, fontSize: height*0.04, fontWeight: FontWeight.w800)),
                    ],
                  ),
              SizedBox(
                height: height*0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  focusNode: uname,
                  controller: username,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    labelText: 'Username',
                    labelStyle: TextStyle(fontSize: height*0.02, fontWeight: FontWeight.bold, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: highlight)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: highlight)),
                  ),
                ),
              ),
                  SizedBox(
                    height: height*0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      focusNode: pass,
                      controller: password,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: height*0.02, fontWeight: FontWeight.bold, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, color: highlight)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2, color: highlight)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height*0.03,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute<void>(builder: (context)=>HomeScreen()));
                      },
                      child: Container(
                        height: height*0.05,
                        width: width,
                        child: Center(
                            child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: height*0.03, fontWeight: FontWeight.bold))),
                        decoration: BoxDecoration(
                          color: highlight,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(0)),

                      ),
                    ),
                  )

                ],
              ),
            ),

          ),
        ),
    );
  }
}
