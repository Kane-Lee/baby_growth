import 'package:flutter/material.dart';
import 'constants.dart';


class IconContent extends StatelessWidget {
  IconContent({this.iconName, this.contentName});

  final IconData iconName;
  final String contentName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconName,
              size: 80.0),
          SizedBox(
            height: 15.0,
          ),
          Text(contentName,
              style: kLabelTextStyle)
        ],
      ),
    );
  }
}
