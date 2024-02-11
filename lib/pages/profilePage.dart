import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String documentID = '';
  String name = '';
  String mobileNumber = '';
  String medicalInfo = '';
  String EmergencyNumber = '';
  String RoleUSer = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance
          .collection('User')
          .where('MobileNumber', isEqualTo: '+919503904361')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs[0].data();
        setState(() {
          documentID = querySnapshot.docs[0].id;
          name = userData['Name'];
          mobileNumber = userData['MobileNumber'];
          medicalInfo = userData['MedicalInfo'];
          EmergencyNumber = userData['Emergency Contact'];
          RoleUSer = userData['Role'];

        });
      } else {
        print("User data not found.");
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Profile",style: TextStyle(fontWeight:FontWeight.bold,fontSize:20,color: Colors.green),),
                SizedBox(height: 30,),
                Container(
                  width:300,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),

                  ),
                  child: Column(
                    children: [
      SizedBox(height: 20,),
                      Text('Document ID: $documentID',style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),),
                      SizedBox(height: 15,),
                      Text('Name: $name',style: TextStyle(fontWeight: FontWeight.bold,fontSize:15,),),
                      SizedBox(height: 15,),
                      Text('Mobile Number: $mobileNumber',style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),),
                      SizedBox(height: 15,),
                      Text('Medical Info: $medicalInfo',style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),),
                      SizedBox(height: 15,),
                      Text('Emergency Number: $EmergencyNumber',style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),),
                      SizedBox(height: 15,),
                      Text('Role: $RoleUSer',style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),),
                      SizedBox(height: 15,),
                      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:Colors.black),onPressed: (){}, child: Text("Edit Profile")),
                    ],
                  ),
                ),


              // Add more UI elements as needed
            ],
          ),
        ),
      ),
    );
  }
}
