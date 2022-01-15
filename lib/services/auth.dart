import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:devstack_second_solution/pages/loginIn.dart';

class Auth {

  IncorrectEmail(){
    colorEmailTextField = Colors.red;
    visibleemail = true;
  }

  IncorrectPassword(){
    colorEmailTextField = Colors.red;
    visiblepass = true;
  }

  Future getData(context, _collectionRef, useremail, userpass) async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //String firstelem = allData.elementAt(0);
    for(var n in allData){
      String too = n.toString();
      List<String> list = too.split(':');
      list[0] = list[0].substring(1,);
      list[1] = list[1].substring(1,list[1].length-1);
      if(useremail == list[0]) {
        if (userpass == list[1]) {
          print("Передаю email: ");
          print(list[0]);
          print("Передаю пароль: ");
          print(list[1]);
          Navigator.pushNamedAndRemoveUntil(context, '/successlogin', (route) => false, arguments: {list[0],list[1]});
        }
        else {
          IncorrectPassword();
        }
      }
      else{
        IncorrectEmail();
      }
    }
  }

  Future addData() async {
    String testemail = "test2@gmail.com";
    String testpass = "test2";
    FirebaseFirestore.instance.collection('data').add({testemail: testpass});
  }

  void solution(context, useremail, userpass) async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('data');
    //addData();
    final date = getData(context, _collectionRef, useremail, userpass);
  }
}