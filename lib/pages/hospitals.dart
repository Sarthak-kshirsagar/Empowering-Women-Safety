import 'package:flutter/material.dart';

class DummyMessage extends StatefulWidget {
  const DummyMessage({super.key});

  @override
  State<DummyMessage> createState() => _DummyMessageState();
}

class _DummyMessageState extends State<DummyMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                textAlign: TextAlign.center,
                "Not yet Implemented \n data will be found using ML modelling \n Nearest hospitals with reference to current location will be shown")
          ],
        ),
      ),
    );
  }
}
