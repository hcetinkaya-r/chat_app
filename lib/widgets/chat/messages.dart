import 'package:chat_application/widgets/chat/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = chatSnapshot.data.docs;
        final _currentUser = FirebaseAuth.instance.currentUser;

        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (ctx, index) => MessageBubble(
            message: chatDocs[index]['text'],
            userName: chatDocs[index]['userName'],
            isMe: chatDocs[index].data()['userId'] == _currentUser.uid,
            key: ValueKey(chatDocs[index].id),
            userImage: chatDocs[index]['userImage'],
          ),
        );
      },
    );
  }
}
