import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            'as',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Image.asset('assets/images/photo.jpeg'),
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
