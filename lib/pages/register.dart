import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sihwomen1/pages/homePage.dart';
import 'package:sihwomen1/pages/login.dart';





void main(){
  runApp(
    MaterialApp(
      home: Register(),
    )
  );
}


class Register extends StatefulWidget {
  String? phoneNumber;

   Register({super.key});



  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with SingleTickerProviderStateMixin {


  final FirebaseAuth auth = FirebaseAuth.instance;




  late AnimationController _controller;
  final _rolesList = ["User","Blue Soldier","Watchmen"] ;
  final nameController = TextEditingController();
  final medicalInfoController = TextEditingController();
  final adharNumberController = TextEditingController();
  final EmergencyController = TextEditingController();
  final UserRoleController = TextEditingController();
  String? _selectedValue = "";
  String? flag = "";


  Future<void> addUserData(String? name,String? medicalinfo,String? adharNo,String? emergencyContact,String? role)async{
    User?  user = auth.currentUser;

// ===now if user is logged in then only data will be sent====
    if(user!=null){
      String? uid=user.uid;
      String? phoneNumberr = user.phoneNumber;
      await FirebaseFirestore.instance.collection('User').add({
        'MobileNumber': phoneNumberr,
        'Name':name,
        'MedicalInfo':medicalinfo,
        'AdharNo':adharNo,
        'Emergency Contact':emergencyContact,
        'Role':role,
      });
    }else{
      print("Not Signed");
    }

  }


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(

        child: Container(
          // margin: EdgeInsets.only(top:80),
          child: SingleChildScrollView(
            child: Column(

              children: [


                SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text("SafeW",style:TextStyle(fontSize:30,fontWeight: FontWeight.bold,color:Colors.black)),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Welcome ",style:TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.black)),
                        SizedBox(
                          height: 10,
                        ),

                        Text("Please fill the below details",style:TextStyle(fontSize:15,fontWeight: FontWeight.bold,color:Colors.grey)),
                        SizedBox(height:15,),
                      ],
                    ),
                  ),
                ),

            SingleChildScrollView(
              child: Form(child: Column(
                children: [
                  SizedBox(

                    width:350,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "First Name",
                        hintText: "Enter Your First Name",

                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                      ),
                    ),
                  ),

                // ------------------------------
                SizedBox(height:15,),
                  SizedBox(

                    width:350,
                    child: TextFormField(
                      controller: medicalInfoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Blood Group",
                        hintText: "Enter Your Blood Group",
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                      ),
                    ),
                  ),


                  SizedBox(height:15,),
                  SizedBox(

                    width:350,
                    child: TextFormField(
                      controller: adharNumberController,
                      decoration: InputDecoration(

                        border: OutlineInputBorder(),
                        labelText: "Adhaar Number",
                        hintText: "Enter Your Adhaar Number",
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                      ),
                    ),
                  ),
// --------------------------------------------------------------

                  SizedBox(height:15,),
                  SizedBox(

                    width:350,
                    child: TextFormField(
                      controller: EmergencyController,
                      keyboardType: TextInputType.number,
                      // obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Emergency Contact",
                        hintText: "Enter Your Emergency Contact Number",
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                      ),
                    ),
                  ),


                  SizedBox(height:15,),
                  // SizedBox(
                  //
                  //   width:350,
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.number,
                  //     obscureText: true,
                  //
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: "Adhar Number",
                  //       hintText: "Enter Your Adhar Number",
                  //       prefixIcon: Icon(Icons.drive_file_rename_outline),
                  //
                  //     ),
                  //
                  //   ),
                  // ),

                  SizedBox(height:15,),
                  // SizedBox(
                  //
                  //   width:350,
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: "Full Name",
                  //       hintText: "Enter Your full Name",
                  //       prefixIcon: Icon(Icons.drive_file_rename_outline),
                  //     ),
                  //   ),
                  // ),
                  // DropdownButton(value: _selectedValue,icon: Icon(Icons.arrow_drop_down)
                  //
                  //     ,items: _rolesList.map((e) {
                  //
                  //             return DropdownMenuItem(child: Text(e),value: e,);
                  // }).toList(), onChanged: (val){
                  //     setState(() {
                  //       _selectedValue = val as String;
                  //     });
                  // }
                  //
                  //
                  // ),
                  
                  SizedBox(
                    width: 300,
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

                  //
                  // if (flag == "User") // Use conditional rendering
                  //   Column(
                  //     children: [
                  //       SizedBox(height:15,),
                  //       SizedBox(
                  //
                  //         width:350,
                  //         child: TextFormField(
                  //           keyboardType: TextInputType.number,
                  //           obscureText: true,
                  //
                  //           decoration: InputDecoration(
                  //             border: OutlineInputBorder(),
                  //             labelText: "Any Specific Info",
                  //             hintText: "",
                  //             prefixIcon: Icon(Icons.drive_file_rename_outline),
                  //
                  //           ),
                  //
                  //         ),
                  //       ),
                  //
                  //       SizedBox(height:15,),
                  //       ElevatedButton(style:ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.black,
                  //       ),onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  HomePage(),));
                  //       }
                  //           , child: Text("Register")),
                  //
                  //
                  //
                  //
                  //       // ----------
                  //
                  //
                  //
                  //
                  //     ],
                  //   ),
                  //
                  //
                  // // --------
                  //
                  //
                  // if (flag == "Watchmen") // Use conditional rendering
                  //   Column(
                  //     children: [
                  //       SizedBox(height:15,),
                  //       SizedBox(
                  //
                  //         width:350,
                  //         child: TextFormField(
                  //           keyboardType: TextInputType.number,
                  //           obscureText: true,
                  //
                  //           decoration: InputDecoration(
                  //             border: OutlineInputBorder(),
                  //             labelText: "Any Specific Info",
                  //             hintText: "",
                  //             prefixIcon: Icon(Icons.drive_file_rename_outline),
                  //
                  //           ),
                  //
                  //         ),
                  //       ),
                  //
                  //       SizedBox(height:15,),
                  //       ElevatedButton(style:ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.black,
                  //       ),onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(builder:(context) =>HomePage(),));
                  //       }
                  //           , child: Text("Register")),
                  //
                  //
                  //
                  //
                  //       // ----------
                  //
                  //
                  //
                  //
                  //     ],
                  //   ),
                  //
                  //
                  //
                  //
                  // // ------------
                  //
                  //
                  // if (flag == "Blue Soldier") // Use conditional rendering
                  //   Column(
                  //     children: [
                  //       SizedBox(height:15,),
                  //       SizedBox(
                  //
                  //         width:350,
                  //         child: TextFormField(
                  //           keyboardType: TextInputType.number,
                  //           obscureText: true,
                  //
                  //           decoration: InputDecoration(
                  //             border: OutlineInputBorder(),
                  //             labelText: "Any Specific Info",
                  //             hintText: "",
                  //             prefixIcon: Icon(Icons.drive_file_rename_outline),
                  //
                  //           ),
                  //
                  //         ),
                  //       ),
                  //
                  //       SizedBox(height:15,),
                  //       ElevatedButton(style:ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.black,
                  //       ),onPressed: () {
                  //         Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  LoginPage(),));
                  //       }
                  //           , child: Text("Register")),
                  //
                  //
                  //
                  //
                  //       // ----------
                  //
                  //
                  //
                  //
                  //     ],
                  //   ),


                  // ---
                  SizedBox(height: 20,),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black),onPressed: (){
                    addUserData(nameController.text,medicalInfoController.text,adharNumberController.text,EmergencyController.text,_selectedValue);
                    final snackBarLogOUt = SnackBar(content: Text("Registered Successfully"),backgroundColor: Colors.green,action: SnackBarAction(textColor: Colors.black,label: "Dismiss", onPressed: (){}),);
                    ScaffoldMessenger.of(context).showSnackBar(snackBarLogOUt);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
                  }, child: Text("Register")),


                ],


              ),

              ),
            ),

                // ---------------form widget ---------------


              ]
            ),
          ),



        ),

      ),

    );
  }
}
