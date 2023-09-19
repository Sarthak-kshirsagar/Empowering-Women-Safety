import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstAidHelp extends StatefulWidget {
  @override
  _FirstAidHelpState createState() => _FirstAidHelpState();
}

class _FirstAidHelpState extends State<FirstAidHelp> {

    final Uri _ambulanceUrl = Uri(scheme: 'tel',path: "9503904361");
  //list of the images for the buttons---
  Future<void> _launchUrl()async{
    if(!await launchUrl(_ambulanceUrl)){
      throw Exception('Not Found');
    }
  }
  List<String> imagePaths = [
    'assets/images/aid1.jpg',
    'assets/images/aid1.jpg',
    'assets/images/aid2.jpg',
    'assets/images/aid1.jpg',




  ];

  //list of the images for the buttons
  List<String> buttonNames = [
    'Acid Attack',
    'First Aid',
    'Cuts & Bruises',
    'Shock',

  ];

  int selectedImageIndex = -1; // Track the selected image index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Help'),
      ),
      body: Column(

        children: <Widget>[
          Divider(),

          Text("First Aid Help",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize:25),),
          SizedBox(height: 20,),
          ElevatedButton.icon(onPressed: (){
            _launchUrl();
          },icon: Icon(Icons.medical_services_rounded),label: Text("Call Ambulance"),style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
          SizedBox(height: 10,),
          Text(textAlign:TextAlign.center,"Click on the button \n "
              ""
              "View the zommable images",style: TextStyle(color: Colors.grey,fontSize: 15),),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: buttonNames.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[

                    ElevatedButton(

                      onPressed: () {
                        setState(() {
                          // Toggle the dropdown state when the button is pressed
                          selectedImageIndex =
                          selectedImageIndex == index ? -1 : index;
                        });
                      },
                      child: Text(buttonNames[index]),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),// Use button names
                    ),
                    if (selectedImageIndex == index)
                      GestureDetector(
                        onTap: () {
                          // Oopening the image in zommable view
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ZoomableImage(imagePaths[index]);
                            },
                          ));
                        },
                        child: Image.asset(
                          imagePaths[index],
                          height: 100.0,
                        ),
                      ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ZoomableImage extends StatelessWidget {
  final String imagePath;

  ZoomableImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fisrt Aid Help'),
      ),
      body: PhotoView(
        imageProvider: AssetImage(imagePath),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2,
      ),
    );
  }
}
