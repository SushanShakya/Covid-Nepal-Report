import 'package:flutter/material.dart';

class DataBox extends StatelessWidget {
  final String title;
  final String data;

  const DataBox({Key key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          // height: 100.0,
          margin: const EdgeInsets.all(8.0),
          padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 2.0,
                ),
                // overflow: TextOverflow.ellipsis,
                // maxLines: 1,
              ),
              Text(
                data,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              ),
              Text('People')
            ],
          )),
    );
  }
}
