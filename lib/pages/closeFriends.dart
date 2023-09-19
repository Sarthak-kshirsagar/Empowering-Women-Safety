import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class closeFriends extends StatefulWidget {
  @override
  State<closeFriends> createState() => _closeFriendsState();
}

class _closeFriendsState extends State<closeFriends> {
  final List<Map<String, String>> userList = [
    {'name': 'Utkarsh Patil', 'mobileNumber': '+917020391355'},
    {'name': 'Sarthak Kshirsagar', 'mobileNumber': '+917020391355'},
    {'name': 'Chetan Indulkaer', 'mobileNumber': '+917020391355'},
    {'name': 'Atharva Powalkar', 'mobileNumber': '+917020391355'},
    // Add more user data here
  ];

  Future<void> launchCall(String mobileNumber) async {
    final Uri url = Uri.parse('tel:${mobileNumber}');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:10,),
              Text("Emergency Contacts / Close Friends",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.red),),
              SizedBox(height:10,),
              Text("Call your Close Friends directly",style: TextStyle(fontWeight: FontWeight.bold,fontSize:15,color: Colors.grey),),
              SizedBox(height:25,),
              SizedBox(
                width: 300,
                height:400,
                child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    final userData = userList[index];
                    final name = userData['name'];
                    final mobileNumber = userData['mobileNumber'];

                    return Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          // Text("Close Friends",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          //   SizedBox(height: 30,),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                width:250,
                                height:80,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black,width: 2),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text("$name"),
                                      subtitle: Text("$mobileNumber"),
                                      trailing: IconButton(
                                        icon: Icon(Icons.call),
                                        onPressed: () {
                                          launchCall(mobileNumber.toString());
                                        },
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    );


                  },


                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: ProfilePage(),
//   ));
// }
