import 'package:flutter/material.dart';
import 'package:pta_meeting/pages/comment.dart';

class Home extends StatelessWidget {
  openCommentPage() {
    return Text('Open Comment Page');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "PTA Meeting",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 36.0,
                decoration: null,
              ),
              textDirection: TextDirection.ltr,
            ),
            GestureDetector(
              onTap: openCommentPage,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Comment()))
                },
                child: Text('Click Me'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
