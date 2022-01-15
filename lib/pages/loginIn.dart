import 'package:flutter/material.dart';
import 'package:devstack_second_solution/services/auth.dart';
import 'package:devstack_second_solution/main.dart';

var colorEmailTextField = Colors.black;
var colorPassTextField = Colors.black;
var visibleemail = false;
var visiblepass = false;

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController inputemailcontroller = new TextEditingController();
  TextEditingController inputpasscontroller = new TextEditingController();
  String getvalue1 = "";
  String getvalue2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       padding: EdgeInsets.all(30),
       color: Colors.black12,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget> [
           Text(
             "Email",
             style: TextStyle(
               color: Colors.red,
               fontSize: 12,
               fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(height: 5),
           Container(
             alignment: Alignment.centerLeft,
             height: 30,
             child: TextField(
               controller: inputemailcontroller,
               keyboardType: TextInputType.emailAddress,
               decoration: InputDecoration(
                 enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(
                     color: colorEmailTextField,
                   ),
                 ),
               ),
               style: TextStyle(
                 color: colorEmailTextField,
               ),
             ),
           ),
           SizedBox(height: 20),
           Visibility(child:
             Text(
               "Not a valid email.",
               style: TextStyle(
                 color: colorEmailTextField,
                 fontSize: 10,
                 fontWeight: FontWeight.bold,
               ),
             ),
             visible: visibleemail,
           ),
           SizedBox(height: 5),
           Text(
             "Password",
             style: TextStyle(
               color: Colors.red,
               fontSize: 12,
               fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(height: 5),
           Container(
             alignment: Alignment.centerLeft,
             height: 30,
             child: TextField(
               controller: inputpasscontroller,
               obscureText: true,
               decoration: InputDecoration(
                 enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(
                     color: colorPassTextField,
                   ),
                 ),
               ),
               style: TextStyle(
                 color: colorPassTextField,
               ),
             ),
           ),
           SizedBox(height: 5),
           Visibility(child:
           Text(
             "Password too short.",
             style: TextStyle(
               color: colorPassTextField,
               fontSize: 10,
               fontWeight: FontWeight.bold,
             ),
           ),
             visible: visiblepass,
           ),
           SizedBox(height: 20),
           Center(
             child:
              ElevatedButton(
               onPressed: (){
                 Auth authorization = Auth();
                 authorization.solution(context, inputemailcontroller.text, inputpasscontroller.text);
                 },//Authentication(),
               child: Text("LOGIN"),
             ),
           ),
           SizedBox(height: 5),
           Center(
             child:
             ElevatedButton(
               onPressed: (){
               },//Authentication(),
               child: Text("LOGIN UP"),
             ),
           ),
         ],
       ),
      )
    );
  }
}
