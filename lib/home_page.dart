

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_nagair/ticket_view.dart';
import 'package:sizer/sizer.dart';
import 'bottom_nav_page.dart';

class HomePage extends StatelessWidget{








  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              SizedBox(height: 50.sp,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [

                      Text("Good morning",
                          style: TextStyle(fontSize: 17,color: Colors.grey.shade500,fontWeight: FontWeight.bold)
                      ),

                      SizedBox(width: 5.sp,),

                      Text("Book Tickets",
                          style: TextStyle(fontSize: 26,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold)
                      ),

                    ],
                  ),





                  Container(
                    child: Image.asset("assets/nag-air-logo.png",
                      height: 50,
                      width: 170,
                    ),
                  )


                ],
              ),


              SizedBox(height: 20,),


              InkWell(onTap:() {
                // Navigator.pop(context);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BottomBar(
                              initindx: 1,
                            )));

              }, child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white

                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                  child: Row(
                    children: [
                      Icon(Icons.search),

                      Text("Search for booking")
                    ],
                  )
              ),),




              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upcoming Flight",
                    style: TextStyle(fontSize: 21,color: Color(0xFF3b3b3b),fontWeight: FontWeight.bold),
                  ),



                  InkWell(
                    onTap: (){
                      print("You are tapped");
                    },
                    child : Text("View all",
                      style: TextStyle(fontSize: 16,color: Colors.pink.shade800,fontWeight: FontWeight.w500),
                    ),)



                ],
              ),


              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                height: 28.h,
                width: 100.h,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: TicketView(
                            isColor: true,
                          )//Center(child: Text('Dummy Card Text')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

}