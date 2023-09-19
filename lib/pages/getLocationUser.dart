import 'dart:async';
// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sihwomen1/pages/verifyPhoneNumber.dart';
import 'package:url_launcher/url_launcher.dart';





class getLocationUser extends  StatefulWidget {
  @override
  State<getLocationUser> createState() => _getLocationUserState();

}

class _getLocationUserState extends State<getLocationUser> {

final FirebaseAuth auth = FirebaseAuth.instance;


//
// void getUSerData(){
//   //created the object for the user
//   final user = FirebaseAuth.instance.currentUser;
//
//   if (user != null) {
//     final String? phoneNumber = user.phoneNumber;
//     // Name, email address, and profile photo URL
//
//
//   }
//
// }


// =======function to send data in firestore db
Future<void> addUserData(String? longitude,String? latitude,String? altitude)async{
User?  user = auth.currentUser;

// ===now if user is logged in then only data will be sent====
if(user!=null){
  String? uid=user.uid;
  String? phoneNumberr = user.phoneNumber;
  await FirebaseFirestore.instance.collection('User').add({
    'MobileNumber': phoneNumberr,
    'Longitude': longitude,
    'Latitude': latitude,
    'Altitude': altitude
  });
}else{
  print("Not Signed");
}






}

  //declaring the required variables
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "" , alt = "";
  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    checkGps();
    super.initState();
  }

// ------------function to on the gpssssssss------------
  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if(servicestatus){
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }else if(permission == LocationPermission.deniedForever){
          print("'Location permissions are permanently denied");
        }else{
          haspermission = true;
        }
      }else{
        haspermission = true;
      }

      if(haspermission){
        setState(() {
          //refresh the UI
        });

        getLocation();

      }
    }else{
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }


  // -----------fucntion to get the locationnnnnnn-------------


  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude);
    print(position.altitude);//Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();
    alt = position.altitude.toString();

    setState(() {
      //refresh UI
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457
      print(position.altitude);

      long = position.longitude.toString();
      lat = position.latitude.toString();
      alt = position.altitude.toString();


      setState(() {
        //refresh UI on update
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: Text("Get GPS Location"),
            // backgroundColor: Colors.redAccent
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: Column(
                children: [

                  Text(servicestatus? "GPS is Enabled": "GPS is disabled."),
                  // Text(haspermission? "GPS is Enabled": "GPS is disabled."),

                  SizedBox(height: 20,),

                  Container(
                    width:300,
                    child: Column(
                      children: [
                        Text("Longitude: $long", style:TextStyle(fontSize:15)),
                        SizedBox(height: 10),
                        Text("Latitude: $lat", style: TextStyle(fontSize:15),),
                        SizedBox(height: 10,),
                        Text("Altitude: $alt",style:TextStyle(fontSize:15)),
                      ],
                    ),
                  ),

      SizedBox(height: 20,),
                  ElevatedButton(onPressed: () async{
                    Uri userSms = Uri.parse('sms:9284674008?body=Latitude:${lat}\nLongitude:${long}\nAltitude:${alt}');
                    if (await launchUrl(userSms)){

                    }
                  }, child: Text("Request Help" )),
                  ElevatedButton(onPressed: (){
                    // getUSerData();
                    addUserData(long, lat, alt);
                  }, child: Text("Upload Data"))

                ]
            )
        )
    );
  }
}
