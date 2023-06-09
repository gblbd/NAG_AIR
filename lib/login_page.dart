

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_nagair/home_page.dart';
import 'package:new_nagair/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import 'bottom_nav_page.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget
{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();

  TextEditingController passwordController=TextEditingController();

  Map <String, dynamic>? apiMap;

  bool _isObscure=true;

  // Future getUserData() async
  @override
  Widget build(BuildContext context) {


    check();
    // TODO: implement build
    return Scaffold(
      body: Container(


        decoration: BoxDecoration(

          image: DecorationImage(
            image: AssetImage("assets/window_view.jpg"),
            fit: BoxFit.cover
          )

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              child:TextField(
                maxLines: 1,
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: GoogleFonts.raleway(

                    ),
                    floatingLabelStyle: GoogleFonts.raleway(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,

                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: "Email",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.pink,
                            width: 1.0
                        )
                    )
                ),
              ),),


            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              child:TextField(
                maxLines: 1,
                controller: passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(





                    suffixIcon: IconButton(
                      icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          _isObscure= !_isObscure;
                        });
                      },
                    ),
                    suffixIconColor: Colors.grey,

                    labelStyle: GoogleFonts.raleway(

                    ),
                    floatingLabelStyle: GoogleFonts.raleway(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,

                    ),
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: "Password",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.pink,
                            width: 1.0
                        )
                    )
                ),
              ),),




            ElevatedButton(
              onPressed: () async {

                if(emailController.text.isEmpty)
                  {

                    Fluttertoast.showToast(
                        msg: "Email is empty",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                    return;
                  }

                if(passwordController.text.isEmpty)
                {

                  Fluttertoast.showToast(
                      msg: "Password is empty",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                  return;
                }
               // Navigator.pop(context);

                //getUserData();

                Map<String, String> body = {
                  "email":"${emailController.text}",
                  "password":"${passwordController.text}"
                };

                var response=await http.post(
                    Uri.parse('https://nag-air-server.vercel.app/api/signin'),
                    body: json.encode(body),
                    headers: {
                      'Content-Type': 'application/json'
                    }
                );

                print(response.body);
                print(response.statusCode);

                apiMap = jsonDecode(response.body);

                if(response.statusCode==200){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BottomBar(
                                initindx: 0,
                                usersName: "${apiMap?["user"]["name"]}",
                                usersEmail: "${apiMap?["user"]["email"]}",
                                usersID: "${apiMap?["user"]["_id"]}",
                                usersToken: "${apiMap?["token"]}",
                              )
                      )
                  );

                  setNoteData("${apiMap?["token"]}","${apiMap?["user"]["name"]}","${apiMap?["user"]["email"]}","${apiMap?["user"]["_id"]}");

                }
                else{

                  Fluttertoast.showToast(
                      msg: jsonDecode(response.body)['error'].toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }


                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             BottomBar(
                //               initindx: 0,
                //             )));

                // Get.to(BottomBar(),
                //     duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                //     transition: Transition.rightToLeft );




              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 32.w, vertical: 2.h),
                backgroundColor: Colors.pink,
                shape: StadiumBorder(),
              ),
              child: Text(
                "Log in",
                style: TextStyle(color: Colors.white, fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),


            SizedBox(height: 5.h,),










            InkWell(
              onTap: (){


                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        ForgotPassword()
                    )
                );

              },
              child:  Text("Forgot password ?",
                style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.pink
                ),
              ),
            ),


            SizedBox(height: 5.h,),




            InkWell(
              onTap: (){


                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             RegistrationScreen()));

                 Get.to(RegistrationPage());


              },
              child:  Text("No Account ? Click here to register",
                style: GoogleFonts.raleway(

                    fontSize: 20,
                    color: Colors.pink
                ),
              ),
            )


          ],
        ),
      ),
    );
  }

  Future<void> setNoteData(String token,String username,String UserEmail,String UserID) async {

    final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();

    sharedPreferences.setString("Token", token);
    sharedPreferences.setString("UserName", username);
    sharedPreferences.setString("UserEmail", UserEmail);
    sharedPreferences.setString("UserID", UserID);



  }

  Future<dynamic> check() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("Token")) {

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
          BottomBar(
              initindx: 0,
              usersName: "${prefs.get("UserName")}",
              usersEmail: "${prefs.get("UserEmail")}",
              usersID: "${prefs.get("UserID")}",
              usersToken: "${prefs.get("Token")}",
            )
          )
      );

      // return BottomBar(
      //   initindx: 0,
      //   usersName: "${prefs.get("UserName")}",
      //   usersEmail: "${prefs.get("UserEmail")}",
      //   usersID: "${prefs.get("UserID")}",
      //   usersToken: "${prefs.get("Token")}",
      // );

    }

  }



}