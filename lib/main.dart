import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sihwomen1/pages/login.dart';
import 'package:sihwomen1/pages/register.dart';

// import 'package:geolocator/geolocator.dart';


void main(){
  runApp(MaterialApp(
    home:Landing(),
  ));
}


class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
    // kajlalv
    return Scaffold(
      body: Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 500,
                height: 300,
                child: Container(
                  child: Image.asset("assets/images/img1.jpg"),
                ),

                // ---buttons


              ),
              Text("Empowering Women Safety",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
              SizedBox(height: 10),
              Text("Prouldy Created with ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.grey),),
              SizedBox(height: 10),
              Text("Bharat",style:TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Colors.orange),),
              SizedBox(height: 10),

              SizedBox(
                height: 200,
                child: Column(
                  children: [
                    ElevatedButton(style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,

                    ),onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register(),));
                    }, child: Text("Register")),
                    ElevatedButton(style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
                    }, child: Text("Sign In")),
                    SizedBox(
                      height: 10,
                    ),
                    Text.rich(TextSpan(
                      text: "Forgot Password ?",
                      // style: ,
                      children: [
                        TextSpan(
                          text: ' Reset Now',
                          style: TextStyle(color: Colors.blue),
                          children: [

                          ],
                        ),
                      ],
                    ),)
                  ],
                ),
              )

            ],
          )
      ),
    );
  }
}
