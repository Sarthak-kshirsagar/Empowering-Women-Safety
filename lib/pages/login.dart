import 'package:flutter/material.dart';
import 'package:sihwomen1/pages/homePage.dart';





class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
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



              Form(child: Column(children: [
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(width:20)),
                      label: Text("Enter UserName"),
                      contentPadding: EdgeInsets.only(left: 10)

                    ),
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                       border: OutlineInputBorder(borderSide: BorderSide(width:20)),
                        label: Text("Enter Password"),
                        contentPadding: EdgeInsets.only(left: 10)


                    ),

                  ),
                ),
      SizedBox(
          height: 15,
      ),
                ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomePage(),));
                },  child: Text("Login"))
              ],))

            ],
          ),
        ),
      ),
    );
  }
}
