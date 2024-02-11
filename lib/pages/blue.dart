import 'package:flutter/material.dart';

class Blue extends StatefulWidget {
  const Blue({super.key});

  @override
  State<Blue> createState() => _BlueState();
}

class _BlueState extends State<Blue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                textAlign: TextAlign.center,
                "Not yet Implemented \n data will be found using ML modelling \n Nearest Soldiers with reference to current location will be shown")
          ],
        ),
      ),
    );
  }
}
