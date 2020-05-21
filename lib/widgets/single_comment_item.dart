import 'package:flutter/material.dart';
import 'package:pta_meeting/pages/comment.dart';
import 'package:pta_meeting/widgets/default_profile_image.dart';

Widget buildSingleCommentItem(
    BuildContext context, List<CommentModel> comments, int index) {
  bool isMe = comments[index].isMe;
  String message = comments[index].message;
  String timestamp = comments[index].timestamp;

  return Container(
    padding: const EdgeInsets.all(20.0),
    margin: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: isMe ? Colors.white : Colors.indigoAccent.shade700,
      borderRadius: isMe
          ? BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(0),
            )
          : BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(10.0),
            ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      children: <Widget>[
        Text(
          message,
          style: TextStyle(
            color: isMe ? Colors.black : Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Comforta-Regular'
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  isMe
                      ? Icon(
                          Icons.account_circle,
                          size: 40.0,
                        )
                      : defaultProfileImage(size: 40.0),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                  ),
                  Text(
                    isMe ? 'You' : 'Vintage Heights',
                    style: TextStyle(
                        color: isMe ? Colors.black : Colors.white,
                        fontSize: 14.0),
                  )
                ],
              ),
            ),
            
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                timestamp,
                style: TextStyle(color: isMe ? Colors.black : Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
