import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home_model.dart';

class WhisListScreen extends StatelessWidget {
   WhisListScreen({Key? key,
    // required this.item
   }) : super(key: key);
   // final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name:'),
            Text('Description: }'),
          ],

        ),
      ),
    );
  }
}
