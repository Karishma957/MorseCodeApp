import 'package:flutter/material.dart';

class NormalHomePage extends StatelessWidget {
  final searchValue = TextEditingController();
  final List

  messages

  = [
  {
  'sender': 'name lastName 1',
  'lastMessage': 'This is the last message sent to this contact by this pnone number'
  },
  {
  'sender': 'name lastName 2',
  'lastMessage': 'This is the last message sent to this contact b  aaaaaaaaaaaaaaaaaaaaa'
  },
  {
  'sender': 'name lastName 3',
  'lastMessage': 'This is the last message sent to this contact  bbbbbbbbbbbbbbbb'
  },
  {
  'sender': 'name lastName 4',
  'lastMessage': 'This is the last message sent to this contact ccccccccccc'
  },
  {
  'sender': 'name lastName 5',
  'lastMessage': 'This is the last message sent to this contact cccccccccccccc'
  },
    {
      'sender': 'name lastName 6',
      'lastMessage': 'This is the last message sent to this contact cccccccccccccc'
    },
    {
      'sender': 'name lastName 7',
      'lastMessage': 'This is the last message sent to this contact cccccccccccccc'
    },
    {
      'sender': 'name lastName 8',
      'lastMessage': 'This is the last message sent to this contactcccccccccccccc'
    },
    {
      'sender': 'name lastName 5',
      'lastMessage': 'This is the last message sent to this contactcccccccccccccc'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      appBar: AppBar(
        title: Text('CHATS'),
        elevation: 0,
      ),
      drawer: Drawer(
        child: Container(),
      ),
      body: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(16)),
              child: TextField(
                autocorrect: true,
                controller: searchValue,
                onSubmitted: (String input) {
                  print(input.toUpperCase());
                },
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  contentPadding: EdgeInsets.all(7),
                  border: InputBorder.none,
                  hintText: 'Search Name',
                  hintStyle: Theme
                      .of(context)
                      .textTheme
                      .caption,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: messages.length==0?Container():ListView.builder(itemCount: messages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){print(messages[index]['sender']);},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:13.0,horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(messages[index]['sender'], style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text(messages[index]['lastMessage'], style: Theme
                              .of(context)
                              .textTheme
                              .bodyText2, maxLines: 1, overflow: TextOverflow.clip,),
                          Divider(color: Theme
                              .of(context)
                              .primaryColor,)
                        ],
                      ),
                    ),
                  );
                },),
            ),
          ),
        ],
      ),
    );
  }
}
