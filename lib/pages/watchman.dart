import 'package:flutter/material.dart';

class Watchmen extends StatefulWidget {
  const Watchmen({super.key});

  @override
  State<Watchmen> createState() => _WatchmenState();
}

class _WatchmenState extends State<Watchmen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                textAlign: TextAlign.center,
                "Not yet Implemented \n data will be found using ML modelling \n Nearest Watchman with reference to current location will be shown")
          ],
        ),
      ),
    );
  }
}
