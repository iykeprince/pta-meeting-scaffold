import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pta_meeting/widgets/default_profile_image.dart';
import 'package:pta_meeting/widgets/header.dart';
import 'package:pta_meeting/widgets/single_comment_item.dart';

class Comment extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommentPage(),
    );
  }
}

class CommentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CommentPageState();
  }
}

class CommentPageState extends State<CommentPage> {
  double width, height;
  TextEditingController textController;
  List<CommentModel> comments = [];
  ScrollController _scrollController;
  bool showAppBar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    comments = getDummyComments();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  //listener for scroll events
  _scrollListener() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
        setState(() {
          showAppBar = true;
        });
      }
    }

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
        setState(() {
          showAppBar = false;
        });
      }
    }
  }

  //Comment listview widget
  Widget buildCommentList() {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Comments (${comments.length})',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Center(
            child: Column(
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
//        controller: ,
                    itemCount: comments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildSingleCommentItem(context, comments, index);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildChatInput() {
    return SizedBox(
      height: 50.0,
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Enter your comment here...',
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          //fillColor: Colors.green
        ),
      ),
    );
  }

//method to return chat send buttton widget
  Widget buildSendButton() {
    return FloatingActionButton(
      backgroundColor: Colors.indigoAccent.shade700,
      onPressed: handleSendMessage,
      child: Icon(
        Icons.send,
        size: 30,
      ),
    );
  }

  //method to handle button click event
  handleSendMessage() {
    print('send chat message button');
    comments.clear();
    setState(() => {comments = getDummyComments()});
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: showAppBar ? customAppBar('Comments') : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: showAppBar
                          ? EdgeInsets.all(10.0)
                          : EdgeInsets.only(top: 24.0),
                      child: Text(
                        'PTA Meeting',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    padding: EdgeInsets.only(
                        top: 16.0, left: 8.0, right: 8.0, bottom: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        defaultProfileImage(),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Vintage Heights',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    ' | ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    '5 January, 2020',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              Text(
                                "To you (Tolulope Saba)",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "1. We are now charge for Bitcoin deposit. We deduct a small amount of each Bitcoin amount you send to our app.",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          Text(
                            '2. We posted this notice in our community group few days ago. But since too many people missed it, we decided to write it in this email as well',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: FlatButton.icon(
                                onPressed: () =>
                                    print('Add to calendar button pressed!'),
                                icon: Icon(Icons.calendar_today),
                                label: Text('Add to calendar'),
                                textColor: Colors.indigoAccent.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // From here
                  Container(
                    width: width,
                    color: Colors.grey.shade100,
                    margin: EdgeInsets.only(top: 16.0),
                    child: Column(
                      children: <Widget>[
                        buildCommentList(),
                      ],
                    ),
                  ),
                  //to here
                ],
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        buildChatInput(),
        buildSendButton(),
      ],
    );
  }

  // List containing dummy comments to be populated in the app
  List<CommentModel> getDummyComments() {
    List<CommentModel> comments = [];
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        true));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        true));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        true));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        true));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        true));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        true));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        true));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        true));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        false));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        true));
    comments.add(CommentModel(
        'This is how a comment will look on mobile application',
        "5 Janary, 2020",
        true));

    // print(comments);
    return comments;
  }
}

class CommentModel {
  String message;
  String timestamp;
  bool isMe;

  CommentModel(this.message, this.timestamp, this.isMe);

  @override
  String toString() {
    return ' { ${this.message} - ${this.timestamp} from me ${this.isMe} } ';
  }
}
