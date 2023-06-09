


import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class RegistrationPage extends StatefulWidget{

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController=TextEditingController();

  TextEditingController nameController=TextEditingController();

  TextEditingController passwordController=TextEditingController();

  TextEditingController confirmPasswordController=TextEditingController();

  bool _isObscure=true;

  bool _isObscure2=true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Registration"),),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              child:TextField(
                maxLines: 1,
                controller: nameController,
                decoration: InputDecoration(
                    labelText: "Name",
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
                    hintText: "Your Name",
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


            // Padding(
            //   padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            //   child:TextField(
            //     maxLines: 1,
            //     //controller: emailController,
            //     decoration: InputDecoration(
            //         labelText: "Cell Number",
            //         labelStyle: GoogleFonts.raleway(
            //
            //         ),
            //         floatingLabelStyle: GoogleFonts.raleway(
            //           fontSize: 30,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.pink,
            //
            //         ),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(30)
            //         ),
            //         filled: true,
            //         fillColor: Colors.white70,
            //         hintText: "Your Cell Number",
            //         focusedBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //             borderSide: BorderSide(
            //                 color: Colors.pink,
            //                 width: 1.0
            //             )
            //         )
            //     ),
            //   ),),
            //
            //
            //
            //
            //
            //
            // Padding(
            //   padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            //   child:TextField(
            //     maxLines: 1,
            //     //controller: emailController,
            //     decoration: InputDecoration(
            //         labelText: "Recidence Phone No.",
            //         labelStyle: GoogleFonts.raleway(
            //
            //         ),
            //         floatingLabelStyle: GoogleFonts.raleway(
            //           fontSize: 30,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.pink,
            //
            //         ),
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(30)
            //         ),
            //         filled: true,
            //         fillColor: Colors.white70,
            //         hintText: "Your Recidence Phone No.",
            //         focusedBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //             borderSide: BorderSide(
            //                 color: Colors.pink,
            //                 width: 1.0
            //             )
            //         )
            //     ),
            //   ),),




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



            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              child:TextField(
                maxLines: 1,
                controller: confirmPasswordController,
                obscureText: _isObscure2,
                decoration: InputDecoration(


                    suffixIcon: IconButton(
                      icon: Icon(_isObscure2 ? Icons.visibility : Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          _isObscure2= !_isObscure2;
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
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: "Confirm your Password",
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

                if(nameController.text.isEmpty)
                {

                  Fluttertoast.showToast(
                      msg: "Name field is empty",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                  return;
                }

                if(confirmPasswordController.text.isEmpty)
                {

                  Fluttertoast.showToast(
                      msg: "Confirm your Password",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                  return;
                }

                if(passwordController.text!=confirmPasswordController)
                {

                  Fluttertoast.showToast(
                      msg: "Password is not matched",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                  return;
                }




                //Register();



                Map<String, String> body = {
                  "name":"${nameController.text}",
                  "email":"${emailController.text}",
                  "password":"${passwordController.text}",
                  "role": "passenger"
                };

                var response=await http.post(
                    Uri.parse('https://nag-air-server.vercel.app/api/signup'),
                    body: json.encode(body),
                    headers: {
                      'Content-Type': 'application/json'
                    }
                );

                print(response.body);
                print(response.statusCode);

                //apiMap = jsonDecode(response.body);

                if(response.statusCode==200){

                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Registration Complete'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[

                              Icon(Icons.check_circle_outline,

                                size: 50,
                                color: Colors.green,

                              )
                              // Text('Regi'),
                              // Text('Would you like to approve of this message?'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );

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








                // Navigator.pop(context);

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
                "Register",
                style: TextStyle(color: Colors.white, fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),


            SizedBox(height: 5.h,),




          ],
        ),
      ),
    );
  }
}