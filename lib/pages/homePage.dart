import 'package:flutter/material.dart';
import 'package:sihwomen1/pages/getLocationUser.dart';
import 'package:url_launcher/url_launcher.dart';

// url_launcher.dart;


void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}


class HomePage extends StatefulWidget {
  HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _currentUser = "Vaishnavi";
  String? _currentUSerEmailAddress = "vaishnavi.chopde@pccoepune.org";
  final Uri _url = Uri.parse("https://www.google.com/maps/search/nearby+poilce+stations");
  final Uri _urlCurrent = Uri.parse("https://www.google.com/maps");





  Future<void> _launchUrl()async{
    if(!await launchUrl(_url)){
      throw Exception('Not Found');
    }
  }

  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Add your pages here
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu_book_sharp),
        title: Text("WSafe"),
        centerTitle: true,

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(decoration: BoxDecoration(

              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),currentAccountPicture: CircleAvatar(backgroundImage:AssetImage("assets/images/img4.png")),accountName: Text("$_currentUser",style: TextStyle(color: Colors.black,fontSize:20),), accountEmail: Text("$_currentUSerEmailAddress",style: TextStyle(color: Colors.black),)),


            InkWell(onTap: (){},child: Ink(child: ListTile(leading: Icon(Icons.home),title: Text("Home"),),),),
            InkWell(onTap: (){},child: Ink(child: ListTile(leading: Icon(Icons.people_outline_sharp),title: Text("Close Friends"),),),),
            InkWell(onTap: (){},child: Ink(child: ListTile(leading: Icon(Icons.edit_sharp),title: Text("Edit Profile"),),),),
            InkWell(onTap: (){},child: Ink(child: ListTile(leading: Icon(Icons.settings),title: Text("Settings"),),),),
            InkWell(onTap: (){},child: Ink(child: ListTile(leading: Icon(Icons.share),title: Text("Share App"),),),),
            InkWell(onTap: (){},child: Ink(child: ListTile(leading: Icon(Icons.help_center),title: Text("Help"),),),),
            InkWell(onTap: (){},child: Ink(child: ListTile(leading: Icon(Icons.feedback_rounded),title: Text("FeedBack"),),),),
            InkWell(onTap: (){},child: Ink(child: ListTile(leading: Icon(Icons.logout),title: Text("Log Out"),),),),



          ],
        ),
      ),
      // bottomNavigationBar:BottomNavigationBar(),
      body:
      // _pages[_currentIndex];
      Padding(
        // padding:EdgeInsets.all(10),
        padding: const EdgeInsets.all(12.0),
        child: Column(

          children: [

            // ----current location widgte---------

            currentLocation(),

            SizedBox(height: 20,),


            // -------------


            Flexible(
              child: GridView.count(crossAxisCount: 2,crossAxisSpacing:15,mainAxisSpacing:20,childAspectRatio:1.5,children: [



                InkWell(
                  onTap:(){
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => getLocation(),));
                  },

                  child: Ink(
                    padding: EdgeInsets.all(0),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFffffff),
                      boxShadow:[BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 1.5,
                        offset: Offset(5.0,5.0),
                      )],

                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(width:80,"assets/images/img1.jpg"),
                        Text(textAlign: TextAlign.justify,"Locate\nBlue \nSoldiers",style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),)
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap:(){},

                  child: Ink(
                    padding: EdgeInsets.all(0),
                    width: 500,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFffffff),
                      boxShadow:[BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 1.5,
                        offset: Offset(5.0,5.0),
                      )],

                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(width:80,"assets/images/img1.jpg"),
                        Text(textAlign: TextAlign.center,"Locate\nWatchmen",style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),)
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap:(){},

                  child: Ink(
                    padding: EdgeInsets.all(0),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFffffff),
                      boxShadow:[BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 1.5,
                        offset: Offset(5.0,5.0),
                      )],

                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(width:80,"assets/images/img1.jpg"),
                        Text(textAlign: TextAlign.center,"Call\nAmbulance",style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),)
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap:(){},

                  child: Ink(
                    padding: EdgeInsets.all(0),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFffffff),
                      boxShadow:[BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 1.5,
                        offset: Offset(5.0,5.0),
                      )],

                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(width:80,"assets/images/img1.jpg"),
                        Text(textAlign: TextAlign.center,"First Aid",style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap:_launchUrl,

                  child: Ink(
                    padding: EdgeInsets.all(0),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFffffff),
                      boxShadow:[BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 1.5,
                        offset: Offset(5.0,5.0),
                      )],

                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(width:80,"assets/images/img1.jpg"),
                        Text(textAlign: TextAlign.center,"Police\nPetrol\nTimings",style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),)
                      ],
                    ),
                  ),
                ),



                InkWell(
                  onTap:(){},

                  child: InkWell(
                    onTap: ()async{

                    },
                    child: Ink(

                      padding: EdgeInsets.all(0),
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFFffffff),
                        boxShadow:[BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          spreadRadius: 1.5,
                          offset: Offset(5.0,5.0),
                        )],

                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(width:80,"assets/images/img1.jpg"),
                          Text(textAlign: TextAlign.center,"Call\nClose\nFriends",style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),)
                        ],
                      ),
                    ),
                  ),
                ),


              ],),
            ),



            Container(
              width:300,
              height:150,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>getLocationUser(),));
                  },child: Image.asset(width:75,"assets/images/img3.png")),
                  InkWell(child: Image.asset(width:75,"assets/images/img3.png"))
                ],
              ),)
          ],

        ),

      ),
//
//         ),

    );

  }
}


class currentLocation extends StatefulWidget {
  const currentLocation({super.key});

  @override
  State<currentLocation> createState() => _currentLocationState();
}

class _currentLocationState extends State<currentLocation> {
  int? _safetyScore  = 8;
  String? _zoneStatus = "Safer";
  String? _userCurrentLocation = "Pradhikaran";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:400,
      // height:80,
      child: Container(

        padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius:1,
                blurRadius:5,
                offset: Offset(2, 2),


              )
            ]
        ),


        child: Center(
          child: Column(
            children: [
              Text(textAlign: TextAlign.left,"Your Current Location",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),),
              SizedBox(height: 10,),
              Container(
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80,),
                    Image.asset(width:100,"assets/images/img2.png"),
                    Column(

                      children: [
                        Text("$_userCurrentLocation",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("$_safetyScore   ",style: TextStyle(color:Colors.orange,fontWeight:FontWeight.bold),),
                            Text("$_zoneStatus",style: TextStyle(color:Colors.green,fontWeight:FontWeight.bold),),
                          ],

                        ),




                      ],
                    ),

                    ElevatedButton(style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),onPressed: (){},child: Text("View Map")),

                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.call_rounded)),
      ]),
    );
  }
}
