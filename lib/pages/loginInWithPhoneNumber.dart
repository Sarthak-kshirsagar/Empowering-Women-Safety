import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:sihwomen1/pages/homePage.dart';
import 'package:sihwomen1/pages/login.dart';
import 'package:sihwomen1/pages/verifyPhoneNumber.dart';
import 'package:simnumber/sim_number.dart';
import 'package:simnumber/siminfo.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

//string to get the imei of mobilee
  String imei = 'IMEI: N/A';


  // -----firebase auth-----------
    final auth = FirebaseAuth.instance;

    // --------controleer for text field--
  final phoneNumberController = TextEditingController();
    String mobileNumber = '';



    @override
    void initState() {
      super.initState();

      // calling the method in init state so that the no need of explictly calling the method
      getIMEI();
      getMobileNumber();

    }

// ========================================funtion to get the imei number===============================================


  Future<String> getIMEI() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return 'IMEI: ${androidInfo.androidId}'; // Get the IMEI
      } else {
        // iOS does not have a direct IMEI equivalent
        return 'IMEI: N/A (iOS)';
      }
    } catch (e) {
      print("Error getting IMEI: $e");
      return 'IMEI: Error';
    }
  }

// =====================this code fetch the imei but explictly==============================================

  // Future<String> getIMEI() async {
  //   final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   try {
  //     if (Theme.of(context).platform == TargetPlatform.android) {
  //       final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //       imei = 'IMEI: ${androidInfo.androidId}'; // Get the IMEI
  //     } else {
  //       // iOS does not have a direct IMEI equivalent
  //       imei = 'IMEI: N/A (iOS)';
  //     }
  //   } catch (e) {
  //     print("Error getting IMEI: $e");
  //   }
  //   // if (!mounted) return;
  //   // setState(() {
  //   //   imei = imei;
  //   // });
  // }



    // =========================function to fetch the mobile number====================

    Future<void> getMobileNumber() async {
      if (!await MobileNumber.hasPhonePermission) {
        await MobileNumber.requestPhonePermission;
        return;
      }
      try {
        mobileNumber = (await MobileNumber.mobileNumber)!;
        if (mobileNumber.startsWith("9191")) {
          mobileNumber = mobileNumber.substring(2); // Remove the first 2 characters
        }
      } on PlatformException catch (e) {
        debugPrint("Failed to get mobile number because of '${e.message}'");
      }

      if (!mounted) return;

      setState(() {
        // Update the state with the retrieved mobile number

        mobileNumber = mobileNumber;


        //copying the value directly in the tect field
       phoneNumberController.text = "+" + mobileNumber;
      });
    }


    //     ===================declaring a list for selecting the roles============
  final _rolesList = ["User","Blue Soldier","Watchmen"] ;
  String? _selectedValue = "";
  String? flag = "";

  // ============================================================================
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [

// ======================================================================

              SizedBox(
                width: 500,
                height: 300,
                child: Container(
                  child: Image.asset("assets/images/img1.jpg"),
                ),

                // ---buttons


              ),
              // ===================================================

              Text("Register with Phone Number",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
              SizedBox(height: 20,),

              Text("Data will be fetched automatically\n please request the OTP for Verification",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
              SizedBox(height:30,),



              Container(
                child: FutureBuilder<String>(
                  future: getIMEI(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While waiting for the result, display a loading indicator
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // If there an error, display an error message
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      // When data is available, display the IMEI
                      imei = snapshot.data!;
                      return Center(
                        child: Text(
                          imei,
                          style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.green),
                        ),
                      );
                    }
                  },
                ),
              ),

    SizedBox(height: 20,),


              SizedBox(
                width:200,
                child: TextFormField(

                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    // prefix:Icon(Icons.call_rounded),
                    // contentPadding:EdgeInsets.all(0),
                    prefixIcon: Icon(Icons.call),

                    hintText: "Enter Phone Number",






                  ),
                ),
              ),

              SizedBox(height: 20,),



                // =============================================selecting the roles==========================
              SizedBox(
                width:200,
                child: DropdownButtonFormField(decoration: InputDecoration(
                  label: Text("Select Your Role"),
                ),items: _rolesList.map((e) {
                  return DropdownMenuItem(child: Text(e),value: e);
                }).toList(), onChanged: (val){
                  setState(() {
                    _selectedValue = val as String;
                    flag = val as String;


                  });

                }),
              ),


              if (flag == "Blue Soldier") // Use conditional rendering
                Column(
                  children: [
                    SizedBox(height:15,),
                    SizedBox(

                      width:200,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Any Specific Info",
                          hintText: "",
                          prefixIcon: Icon(Icons.drive_file_rename_outline),

                        ),

                      ),
                    ),
                    SizedBox(height:15,),

                    SizedBox(

                      width:200,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Any Specific Info",
                          hintText: "",
                          prefixIcon: Icon(Icons.drive_file_rename_outline),

                        ),

                      ),
                    ),


                    SizedBox(height:15,),
                    SizedBox(

                      width:200,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Any Specific Info",
                          hintText: "",
                          prefixIcon: Icon(Icons.drive_file_rename_outline),

                        ),

                      ),
                    ),

                    // -----------------disabling the button---------------


                    // ElevatedButton(style:ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.black,
                    // ),onPressed: () {
                    //   Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  HomePage(),));
                    // }
                    //     , child: Text("Register")),




                    // ----------




                  ],
                ),


              // --------


              if (flag == "Watchmen") // Use conditional rendering
                Column(
                  children: [
                    SizedBox(height:15,),
                    SizedBox(

                      width:200,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Any Specific Info",
                          hintText: "",
                          prefixIcon: Icon(Icons.drive_file_rename_outline),

                        ),

                      ),
                    ),

                    // SizedBox(height:15,),
                    // ElevatedButton(style:ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.black,
                    // ),onPressed: () {
                    //   Navigator.of(context).push(MaterialPageRoute(builder:(context) =>HomePage(),));
                    // }
                    //     , child: Text("Register")),




                    // ----------




                  ],
                ),




              // ------------


              if (flag == "User") // Use conditional rendering
                Column(
                  children: [
                    SizedBox(height:15,),
                    SizedBox(

                      width:200,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Any Specific Info",
                          hintText: "",
                          prefixIcon: Icon(Icons.drive_file_rename_outline),

                        ),

                      ),
                    ),

                    SizedBox(height:15,),
                    // ElevatedButton(style:ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.black,
                    // ),onPressed: () {
                    //   Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  LoginPage(),));
                    // }
                    //     , child: Text("Register")),




                    // ----------




                  ],
                ),
// ==========================================Button to get the otp=========================================================
              // ElevatedButton(onPressed:getIMEI, child: Text("Get Info")),
              SizedBox(height:15,),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black),onPressed: (){

                auth.verifyPhoneNumber(phoneNumber: phoneNumberController.text,
                    verificationCompleted: (_){},
                    verificationFailed: (e){

                      print(e);
                    },
                    codeSent: (String verificationId , int? token){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => verifyPhoneNumber(verificationId:verificationId,),));
                    },
                    codeAutoRetrievalTimeout: (e){
                      print(e);
                    });


              }, child: Text("Get Otp")),
            ],
          ),
        ),
      ),
    );
  }
}





// -----------classsssssssss----------------





