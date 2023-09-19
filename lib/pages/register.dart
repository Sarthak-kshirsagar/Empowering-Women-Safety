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
   Register({super.key});



  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _rolesList = ["User","Blue Soldier","Watchmen"] ;
  String? _selectedValue = "";
  String? flag = "";
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
                  // SizedBox(
                  //
                  //   width:350,
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: "First Name",
                  //       hintText: "Enter Your First Name",
                  //       prefixIcon: Icon(Icons.drive_file_rename_outline),
                  //     ),
                  //   ),
                  // ),
                SizedBox(height:15,),
                  // SizedBox(
                  //
                  //   width:350,
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: "Middle Name",
                  //       hintText: "Enter Your Middle Name",
                  //       prefixIcon: Icon(Icons.drive_file_rename_outline),
                  //     ),
                  //   ),
                  // ),
                  //
                  //
                  // SizedBox(height:15,),
                  // SizedBox(
                  //
                  //   width:350,
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       labelText: "Last Name",
                  //       hintText: "Enter Your Last Name",
                  //       prefixIcon: Icon(Icons.drive_file_rename_outline),
                  //     ),
                  //   ),
                  // ),


                  SizedBox(height:15,),
                  SizedBox(

                    width:350,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Mobile Number",
                        hintText: "Enter Mobile Number",
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                      ),
                    ),
                  ),


                  SizedBox(height:15,),
                  SizedBox(

                    width:350,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: true,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Adhar Number",
                        hintText: "Enter Your Adhar Number",
                        prefixIcon: Icon(Icons.drive_file_rename_outline),

                      ),

                    ),
                  ),

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


                  if (flag == "User") // Use conditional rendering
                    Column(
                      children: [
                        SizedBox(height:15,),
                        SizedBox(

                          width:350,
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
                        ElevatedButton(style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  HomePage(),));
                        }
                            , child: Text("Register")),




                        // ----------




                      ],
                    ),


                  // --------


                  if (flag == "Watchmen") // Use conditional rendering
                    Column(
                      children: [
                        SizedBox(height:15,),
                        SizedBox(

                          width:350,
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
                        ElevatedButton(style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context) =>HomePage(),));
                        }
                            , child: Text("Register")),




                        // ----------




                      ],
                    ),




                  // ------------


                  if (flag == "Blue Soldier") // Use conditional rendering
                    Column(
                      children: [
                        SizedBox(height:15,),
                        SizedBox(

                          width:350,
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
                        ElevatedButton(style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  LoginPage(),));
                        }
                            , child: Text("Register")),




                        // ----------




                      ],
                    ),


                  // ---


                ],

              )),
            )

                // ---------------form widget ---------------

              ]
            ),
          ),



        ),

      ),

    );
  }
}
