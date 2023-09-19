import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sihwomen1/pages/homePage.dart';


class verifyPhoneNumber extends StatefulWidget {
  final verificationId;
  const verifyPhoneNumber({super.key,required this.verificationId});

  @override
  State<verifyPhoneNumber> createState() => _verifyPhoneNumberState();
}

class _verifyPhoneNumberState extends State<verifyPhoneNumber> {
  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();
  String? phoneNumberUSer = FirebaseAuth.instance.currentUser?.phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Verify Phone Number"),

            SizedBox(
              width:150,
              child: TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: "Enter Otp",





                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black),onPressed: ()async{

                // ------getting the user credential ---

              final credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode:phoneNumberController.text.toString());

              try{
                await auth.signInWithCredential(credential);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(phoneNumber:phoneNumberUSer,),));
              }catch(e){
                print(e);
              }


            }, child: Text("Verify Otp")),


          ],
        ),
      ),
    );
  }
}
