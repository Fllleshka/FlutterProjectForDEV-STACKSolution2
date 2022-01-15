import 'package:flutter/material.dart';

class SuccessfulLogin extends StatelessWidget {
  final String? email;
  final String? pass;

  SuccessfulLogin(
  {this.email = '',
  this.pass = ''}
      );
  @override
  Widget build(BuildContext context) {
    print(email);
    print(pass);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter login demo"),
        actions: <Widget>[
          TextButton(
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: const Text("Logout",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
          )
        ],
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email: $email",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Text("Password: $pass",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
