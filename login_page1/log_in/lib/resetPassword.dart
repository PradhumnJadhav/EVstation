import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:log_in/ui_helper.dart';
class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  resetPassword (String email  ) async{
    
    try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => 
     UiHelper.customAlertBox(context, "Recovery E-mail sent to  $email"),
    // how to move to login page after thisssss.
    
    );}
      on FirebaseAuthException catch (ex) {
        return UiHelper.customAlertBox(context, ex.code.toString());
      }
  
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
               onPressed: (){
                String email=_emailController.text.toString(); 
                   resetPassword(email) ;

                },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}

 