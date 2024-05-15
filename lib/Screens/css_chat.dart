// ignore_for_file: prefer_final_fields, avoid_print, unused_element, prefer_const_constructors, avoid_function_literals_in_foreach_calls, annotate_overrides, use_super_parameters, unnecessary_string_interpolations

import 'package:cat_app1/constants/constant1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
FirebaseAuth _auth = FirebaseAuth.instance;
class CssChats extends StatefulWidget {
  final String routeid = "css/chats";
  const CssChats({super.key});

  @override
  State<CssChats> createState() => _CssChatsState();
}

class _CssChatsState extends State<CssChats> {
  TextEditingController messagecontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? loggedinuser;
  String? usermail;

  @override
  void initState() {
    super.initState();
    getuser();
  }

  void getuser() {
    final currentuser = _auth.currentUser;
    if (currentuser != null) {
      print("current user email is ${currentuser.email}");
      setState(() {
        usermail = currentuser.email;
      });
    } else {
      print("could not able to get current user details");
    }
  }

  void messagesstream() async {
    Future<void> fetchData() async {
      var startTime = DateTime.now().subtract(Duration(days: 1));
      var endTime = DateTime.now();
      var querySnapshot = await _firestore
          .collection('cssmessages')
          .where('created_at', isGreaterThanOrEqualTo: startTime)
          .where('created_at', isLessThanOrEqualTo: endTime)
          .orderBy('created_at', descending: true)
          .get();

      querySnapshot.docs.forEach((doc) {
        print(doc.data());
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // _auth.signOut();
              // Navigator.pop(context);
              // getMessages();
              messagesstream();
            },
          ),
        ],
        title: Text('⚡️CSS Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messagecontroller,
                      onChanged: (value) {},
                      decoration: kMessageTextFieldDecoration,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed:()async{
                      await _firestore.collection('cssmessages').add({
                        'sender': usermail,
                        'text': messagecontroller.text,
                        'created_at': FieldValue.serverTimestamp(),
                      });
                      print(
                          "addeed the data and the data time  is ${FieldValue.serverTimestamp()}");
                      setState(() {
                        messagecontroller.clear();
                      });
                      print("message added to firebase successfully");
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatefulWidget {
  const MessageStream({super.key});
  @override
  State<MessageStream> createState() => _MessageStreamState();
}
class _MessageStreamState extends State<MessageStream> {
  String? currentuser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('cssmessages')
          .orderBy('created_at', descending: false)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blueAccent,
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        final messages = snapshot.data!.docs.toList().reversed;
        List<MessageBubble> messageBubbles = [];
        currentuser = _auth.currentUser!.email;
        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];
          if (currentuser == messageSender) {}
          final messageWidget = MessageBubble(
            sender: messageSender,
            text: messageText,
            isme: currentuser == messageSender,
          );
          messageBubbles.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isme;
  const MessageBubble({
    Key? key,
    required this.sender,
    required this.text,
    required this.isme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            "$sender",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          Material(
            borderRadius: isme
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            color: isme ? Color.fromARGB(218, 65, 116, 204) : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text("$text",
                  style: TextStyle(
                    color: isme ? Colors.white : Colors.black,
                    fontSize: 15,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
